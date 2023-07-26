//
//  HomeViewController.swift
//  Project2
//
//  Created by user on 7/21/23.
//

import Foundation
import FirebaseAuth
import Resolver
import UIKit

class HomeViewController:UIViewController{
    
    @LazyInjected private var viewModel: HomeViewModel
    
    private var movies: [Movie] = []
    
//    private let textview : UILabel = {
//        let textview = UILabel()
//        textview.text = ""
//        textview.textColor = .systemRed
//        return textview
//    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isPagingEnabled = true

        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        viewModel.getPopularMovies { result in
            switch result {
            case .success(let movieResult):
                print(movieResult.results)
                self.movies = movieResult.results
                self.tableView.reloadData()
            case .error(_, let errorMessage):
                print("Error fetching popular movies: \(errorMessage)")
            case .exception(let error):
                print("Exception: \(error)")
            }
        }
        self.view.backgroundColor = .white
    }
    
    private func setupUI(){
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        tableView.register(MovieItem.self, forCellReuseIdentifier: "MovieCell")
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieItem
        let movie = movies[indexPath.row]
        cell.configure(with: "https://image.tmdb.org/t/p/original/" + movie.posterPath)
        return cell
    }
}
