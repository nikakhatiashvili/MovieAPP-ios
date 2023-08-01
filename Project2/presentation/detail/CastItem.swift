//
//  CastItem.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation
import UIKit
import SDWebImage

class CastItem: UICollectionViewCell {
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(posterImageView)
        setupImageViewConstraints()
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            posterImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 150),
            posterImageView.widthAnchor.constraint(equalToConstant: 110)
        ])
    }

    func configure(with cast: Cast?) {
        let baseURL = "https://image.tmdb.org/t/p/original/"
        if let posterPath = cast?.profilePath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
}
