//
//  MovieDetailController.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import Foundation
import UIKit
import Resolver

class MovieDetailController: UIViewController {
    
    @LazyInjected private var viewModel: MovieDetailViewModel
    
    var movie: Movie?
    let baseURL = "https://image.tmdb.org/t/p/original/"
    
    private var cast: [Cast] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
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
        addViews()
        setupUi()
        setupViewConstraints()
        getDetails()
    }
    
    private func addViews(){
        self.view.addSubview(posterImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(collectionView)
        self.view.backgroundColor = .white
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 500),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 20)
        ])
        
        collectionView.register(CastItem.self, forCellWithReuseIdentifier: "CastCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupUi(){
        titleLabel.text = movie?.title ?? ""
        descriptionLabel.text = movie?.overview ?? ""
        
        if let posterPath = movie?.posterPath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
    
    private func getDetails(){
        viewModel.getDetails(id: movie?.id ?? 1) { result in
            switch result {
            case .success(let movieResult):
                self.cast = movieResult.cast
                self.collectionView.reloadData()
            case .failure(let error):
                print("Error fetching movie details: \(error)")
            }
        }
    }
}

extension MovieDetailController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastItem
        let movie = cast[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
