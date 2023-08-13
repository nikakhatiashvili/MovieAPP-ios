//
//  CastViewController.swift
//  Project2
//
//  Created by user on 8/1/23.
//

import Foundation
import UIKit
import Resolver

class CastViewController: UIViewController {
    
    @LazyInjected private var viewModel: MovieDetailViewModel
    
    var movie:Movie?
    
    let baseURL = "https://image.tmdb.org/t/p/original/"
    private var cast: [Cast] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        getMovieCast()
        setupView()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView.register(CastItem.self, forCellWithReuseIdentifier: "CastCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupView(){
         NSLayoutConstraint.activate([
             collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
             collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
             collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
             collectionView.heightAnchor.constraint(equalToConstant: 180),
         ])
    }
    
    private func getMovieCast(){
        viewModel.getMovieCast(id: movie?.id ?? -1) { result in
            switch result {
            case .success(let movieResult):
                self.cast = movieResult.cast
                self.collectionView.reloadData()
            case .failure(_): break
            }
        }
    }
}

extension CastViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        return CGSize(width: 120, height: 180)
    }
}
