
//  MovieItem.swift
//  Project2
//
//  Created by user on 7/26/23.


import Foundation
import UIKit
import SDWebImage

class MovieItem: UITableViewCell {
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 5
        return descriptionLabel
    }()
    
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            posterImageView.widthAnchor.constraint(equalToConstant: 100),
            posterImageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 8),

            descriptionLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:8)
        ])
    }

    func configure(with movie: Movie?) {
        let baseURL = "https://image.tmdb.org/t/p/original/"
        titleLabel.text = movie?.title
        descriptionLabel.text = movie?.overview
        if let posterPath = movie?.posterPath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
    
    func manageViews(){
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        setupImageViewConstraints()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        manageViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
