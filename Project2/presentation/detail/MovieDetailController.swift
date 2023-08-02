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

    let imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tabContainerView: UIView = {
        let tabContainerView = UIView()
        tabContainerView.translatesAutoresizingMaskIntoConstraints = false
        return tabContainerView
    }()
    
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
        self.view.addSubview(imageContainerView)
        self.view.addSubview(tabContainerView)
        addChild(tabVC)
        view.addSubview(tabVC.view)
        tabVC.view.translatesAutoresizingMaskIntoConstraints = false

        self.view.backgroundColor = .white
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            
            imageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            imageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 400),
            
            posterImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor),
            posterImageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),
            
            tabContainerView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            tabContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tabVC.view.topAnchor.constraint(equalTo: tabContainerView.topAnchor),
            tabVC.view.leftAnchor.constraint(equalTo: tabContainerView.leftAnchor),
            tabVC.view.rightAnchor.constraint(equalTo: tabContainerView.rightAnchor),
            tabVC.view.bottomAnchor.constraint(equalTo: tabContainerView.bottomAnchor),
            
            
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
