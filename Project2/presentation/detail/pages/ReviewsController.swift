//
//  ReviewsController.swift
//  Project2
//
//  Created by user on 8/1/23.
//

import Foundation
import UIKit
import Resolver

class ReviewsController : UIViewController {
    
    var movie:Movie?
    
    private var reviews: [Review] = []
    
    @LazyInjected private var viewModel: MovieDetailViewModel
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isPagingEnabled = true
        tableView.backgroundColor = .white
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addViews()
        setupViewConstraints()
        setupTableView()
        getReviews()
    }
    
    private func setupTableView(){
        tableView.register(ReviewItem.self, forCellReuseIdentifier: "ReviewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func addViews(){
        self.view.addSubview(tableView)
    }
    
    private func setupViewConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 5),
        ])
    }
    
    private func getReviews(){
        viewModel.getMovieReviews(id: movie?.id ?? -1) { result in
            switch result {
            case .success(let reviewResult):
                self.reviews = reviewResult.results ?? []
                self.tableView.reloadData()
                print(self.reviews)
            case .failure(let error):
                print("Error fetching movie details: \(error)")
            }
        }
    }
}

extension ReviewsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewItem
        let review = reviews[indexPath.row]
        cell.configure(with: review)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
