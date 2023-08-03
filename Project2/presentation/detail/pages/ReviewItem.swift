//
//  ReviewItem.swift
//  Project2
//
//  Created by user on 8/3/23.
//

import Foundation
import UIKit
import SDWebImage

class ReviewItem: UITableViewCell {
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userName: UILabel = {
        let username = UILabel()
        username.textColor = .darkText
        username.translatesAutoresizingMaskIntoConstraints = false
        username.font = UIFont.boldSystemFont(ofSize: 18)
        return username
    }()
    
    private let content: UILabel = {
        let content = UILabel()
        content.textColor = .white
        content.textAlignment = .justified
        content.lineBreakMode = .byWordWrapping
        content.numberOfLines = 10
        content.translatesAutoresizingMaskIntoConstraints = false
        content.font = UIFont.boldSystemFont(ofSize: 14)
        return content
    }()
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cardView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            cardView.heightAnchor.constraint(equalToConstant: 200),
            
            posterImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15),
            posterImageView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 15),
            posterImageView.widthAnchor.constraint(equalToConstant: 50),
            posterImageView.heightAnchor.constraint(equalToConstant: 50),
            
            userName.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            userName.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 20),
            userName.rightAnchor.constraint(lessThanOrEqualTo: cardView.rightAnchor, constant: -15),
            
            content.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 20),
            content.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -20),
            content.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 10)
            
        ])
    }

    func configure(with review: Review?) {
        content.text = review?.content ?? ""
        if review?.authorDetails?.username != nil {
            self.userName.text = review?.authorDetails?.username ?? ""
        } else if review?.authorDetails?.name != nil {
            self.userName.text = review?.authorDetails?.name ?? ""
        }
        if let avatarPath = review?.authorDetails?.avatarPath {
            let modifiedAvatarPath = String(avatarPath.dropFirst())
            if let url = URL(string: modifiedAvatarPath) {
                posterImageView.sd_setImage(with: url, placeholderImage: nil)
            } else {
                posterImageView.image = nil
            }
        } else {
            posterImageView.image = nil
        }
    }
    
    private func addViews() {
        contentView.backgroundColor = .white
        cardView.backgroundColor = .lightGray
        contentView.addSubview(cardView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(userName)
        contentView.addSubview(content)
        setupImageViewConstraints()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

