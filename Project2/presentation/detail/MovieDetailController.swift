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
    
    var detailMovie:DetailMovie?
    
    let baseURL = "https://image.tmdb.org/t/p/original/"
    
    
    private let tabVC = TabViewController()

    let imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressContainerView: UIView = {
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
        posterImageView.layer.cornerRadius = 10
        posterImageView.layer.masksToBounds = true
        posterImageView.contentMode = .scaleToFill
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return posterImageView
    }()
    
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return titleLabel
    }()
    
    private let runtimeLabel: UILabel = {
        let runtimeLabel = UILabel()
        runtimeLabel.textColor = .lightGray
        runtimeLabel.textAlignment = .left
        runtimeLabel.numberOfLines = 0
        runtimeLabel.translatesAutoresizingMaskIntoConstraints = false
        runtimeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return runtimeLabel
    }()
    
    private let genres: UILabel = {
        let genres = UILabel()
        genres.textColor = .darkGray
        genres.textAlignment = .left
        genres.numberOfLines = 0
        genres.translatesAutoresizingMaskIntoConstraints = false
        genres.font = UIFont.boldSystemFont(ofSize: 17)
        return genres
    }()
    
    private let voteAverage: UILabel = {
        let genres = UILabel()
        genres.textColor = .white
        genres.textAlignment = .center
        genres.numberOfLines = 0
        genres.translatesAutoresizingMaskIntoConstraints = false
        genres.font = UIFont.boldSystemFont(ofSize: 15)
        return genres
    }()
    
    private let userScore: UILabel = {
        let userScore = UILabel()
        userScore.textColor = .black
        userScore.textAlignment = .center
        userScore.text = "User Score"
        userScore.numberOfLines = 0
        userScore.translatesAutoresizingMaskIntoConstraints = false
        userScore.font = UIFont.boldSystemFont(ofSize: 16)
        return userScore
    }()
    
    let circularProgreessBar: CircularProgressBarView = {
        let circularProgressBar = CircularProgressBarView(frame: .zero)
        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false
       return circularProgressBar
    }()
    
    var circularViewDuration: TimeInterval = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        tabVC.movie = movie
        getDetails()
        addViews()
        setupUi()
        setupViewConstraints()
    }
    
    private func addViews(){
        self.view.addSubview(posterImageView)
        self.view.addSubview(progressContainerView)
        self.view.addSubview(imageContainerView)
        self.view.addSubview(tabContainerView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(runtimeLabel)
        self.view.addSubview(genres)
        self.view.addSubview(circularProgreessBar)
        self.view.addSubview(voteAverage)
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
            
            posterImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 95),
            posterImageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor, constant: 20),
            posterImageView.widthAnchor.constraint(equalToConstant: 200),
            posterImageView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
            
            runtimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            runtimeLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            
            genres.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 13),
            genres.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            
            progressContainerView.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            progressContainerView.topAnchor.constraint(equalTo: runtimeLabel.bottomAnchor, constant: 20),
            progressContainerView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
            
            circularProgreessBar.topAnchor.constraint(equalTo: progressContainerView.topAnchor),
            circularProgreessBar.bottomAnchor.constraint(equalTo: progressContainerView.bottomAnchor),
            circularProgreessBar.leftAnchor.constraint(equalTo: progressContainerView.leftAnchor),
            circularProgreessBar.rightAnchor.constraint(equalTo: progressContainerView.rightAnchor),
            
            voteAverage.topAnchor.constraint(equalTo: progressContainerView.topAnchor, constant: 10),
            voteAverage.bottomAnchor.constraint(equalTo: progressContainerView.bottomAnchor),
            voteAverage.leftAnchor.constraint(equalTo: progressContainerView.leftAnchor, constant: 25),
            
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
    
    private func getDetails(){
        viewModel.getMovieDetails(id: movie?.id ?? -1){ result in
            switch result {
            case .success(let movieResult):
                self.detailMovie = movieResult
                self.setupUi()
            case .failure(let error):
                print("Error fetching movie details: \(error)")
            }
        }
    }
    
    private func setupUi() {
        if detailMovie?.voteAverage != nil {
            let percentageValue = ((detailMovie?.voteAverage)!  / 10.0) * 100.0
            let percentageString = String(format: "%.0f%%", percentageValue)
            voteAverage.text = percentageString
            circularProgreessBar.createCircularPath(x: 40, y: 20, progressPercentage: percentageValue)
            circularProgreessBar.progressAnimation(duration: circularViewDuration)
        }

        genres.text = viewModel.concatenateGenres(detailMovie?.genres ?? [])
        runtimeLabel.text = viewModel.formatTime(minutes: detailMovie?.runtime ?? -0)
        titleLabel.text = movie?.title
        
        if let posterPath = movie?.posterPath, let url = URL(string: baseURL + posterPath) {
            posterImageView.sd_setImage(with: url, placeholderImage: nil)
        } else {
            posterImageView.image = nil
        }
    }
}
