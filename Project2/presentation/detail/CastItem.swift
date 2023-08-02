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
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    private let originalName: UILabel = {
        let originalName = UILabel()
        originalName.textColor = .black
        originalName.translatesAutoresizingMaskIntoConstraints = false
        originalName.font = UIFont.boldSystemFont(ofSize: 13)
        return originalName
    }()
    
    private let castName: UILabel = {
        let castName = UILabel()
        castName.textColor = .lightGray
        castName.translatesAutoresizingMaskIntoConstraints = false
        
        castName.font = UIFont.boldSystemFont(ofSize: 13)
        return castName
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
        contentView.addSubview(originalName)
        contentView.addSubview(castName)
        setupImageViewConstraints()
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            posterImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 120),
            posterImageView.widthAnchor.constraint(equalToConstant: 800),
            
            originalName.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant:10),
            originalName.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            originalName.rightAnchor.constraint(equalTo: posterImageView.rightAnchor),
            
            castName.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            castName.topAnchor.constraint(equalTo: originalName.bottomAnchor, constant: 8),
            castName.rightAnchor.constraint(equalTo: posterImageView.rightAnchor),
        ])
    }

    func configure(with cast: Cast?) {
        originalName.text = cast?.originalName ?? ""
        castName.text = cast?.character ?? ""
        let baseURL = "https://image.tmdb.org/t/p/original/"
        if let posterPath = cast?.profilePath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
}
