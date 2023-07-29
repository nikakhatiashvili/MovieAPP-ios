//
//  MovieDetailController.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import UIKit

class MovieDetailController: UIViewController {
    
    var movie: Movie?
    let baseURL = "https://image.tmdb.org/t/p/original/"
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byClipping
        return descriptionLabel
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
    
        setupUi()
        setupViewConstraints()
    }
    
    private func setupViewConstraints(){
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 500),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor,constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        ])
    }
    
    
    
    private func setupUi(){
        self.view.backgroundColor = .white
        self.view.addSubview(posterImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie?.title ?? ""
        descriptionLabel.text = movie?.overview ?? ""
        if let posterPath = movie?.posterPath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
}
