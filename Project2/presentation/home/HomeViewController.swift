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
    
    private let moviesLabel: UILabel = {
        let moviesLabel = UILabel()
        moviesLabel.text = "Popular Movies"
        moviesLabel.font = UIFont.boldSystemFont(ofSize: 25)
        moviesLabel.translatesAutoresizingMaskIntoConstraints = false
        moviesLabel.textColor = .black
        return moviesLabel
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isPagingEnabled = true
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupUI()
        getMovies()
    }
    
    private func getMovies(){
        viewModel.getPopularMovies { result in
            switch result {
            case .success(let movieResult):
                self.movies = movieResult.results
                self.tableView.reloadData()
            case .failure(_): break
            }
        }
    }
    
    private func addViews(){
        self.view.addSubview(tableView)
        self.view.addSubview(moviesLabel)
    }
    
    private func setupUI(){
        NSLayoutConstraint.activate([
            moviesLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100),
            moviesLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 16),

            tableView.topAnchor.constraint(equalTo: moviesLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        tableView.register(MovieItem.self, forCellReuseIdentifier: "MovieCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.backgroundColor = .white
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieItem
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailController()
        movieDetailVC.movie = movies[indexPath.row]
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
