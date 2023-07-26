
//  MovieItem.swift
//  Project2
//
//  Created by user on 7/26/23.


import Foundation
import UIKit
import SDWebImage

class MovieItem: UITableViewCell {
    // Create an image view to display the movie poster image
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Set up the constraints for the image view
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            posterImageView.widthAnchor.constraint(equalToConstant: 100),
            posterImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    // Set up the cell with the movie poster image
    func configure(with imageURL: String?) {
        // Use SDWebImage to load and cache the image from the URL
        if let imageURL = imageURL, let url = URL(string: imageURL) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil // Set image to nil if the imageURL is nil or invalid
        }
    }

    // Initialize the cell with a reuse identifier
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageView)
        setupImageViewConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
