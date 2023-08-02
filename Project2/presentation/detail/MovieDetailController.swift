//
//  MovieDetailController.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import UIKit
import Resolver

class MovieDetailController: UIViewController {
    
    @LazyInjected private var viewModel: MovieDetailViewModel
    
    var movie: Movie?
    

    let baseURL = "https://image.tmdb.org/t/p/original/"
    
    
    private let tabVC = TabViewController()

    
    private let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        posterImageView.contentMode = .scaleToFill
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return posterImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabVC.movie = movie
        addViews()
        setupUi()
        setupViewConstraints()
    }
    
    private func addViews(){
        self.view.addSubview(posterImageView)
        addChild(tabVC)
        view.addSubview(tabVC.view)
        tabVC.view.translatesAutoresizingMaskIntoConstraints = false

        self.view.backgroundColor = .white
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 400),
            
            tabVC.view.topAnchor.constraint(equalTo: posterImageView.bottomAnchor),
            tabVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupUi(){
        if let posterPath = movie?.posterPath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
    

    
}
