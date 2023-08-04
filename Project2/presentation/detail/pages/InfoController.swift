//
//  InfoController.swift
//  Project2
//
//  Created by user on 8/1/23.
//

import Foundation
import UIKit
import Resolver

class InfoController: UIViewController {
    
    @LazyInjected private var viewModel: MovieDetailViewModel
    
    var movie:Movie?
    private var movieDetals:DetailMovie?
    
    private let releaseDateLabel: UILabel = {
        let releaseDateLabel = UILabel()
        releaseDateLabel.textColor = .black
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return releaseDateLabel
    }()
    
    private let releaseDate: UILabel = {
        let releaseDate = UILabel()
        releaseDate.textColor = .lightGray
        releaseDate.text = "March 29, 2019"
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.font = UIFont.boldSystemFont(ofSize: 13)
        return releaseDate
    }()
    
    
    private let languageLabel: UILabel = {
        let languageLabel = UILabel()
        languageLabel.textColor = .black
        languageLabel.text = "Language"
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return languageLabel
    }()
    
    private let language: UILabel = {
        let languageLabel = UILabel()
        languageLabel.textColor = .lightGray
        languageLabel.text = "English"
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return languageLabel
    }()
    
    
    private let budgetLabel: UILabel = {
        let budgetLabel = UILabel()
        budgetLabel.textColor = .black
        budgetLabel.text = "Budget"
        budgetLabel.translatesAutoresizingMaskIntoConstraints = false
        budgetLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return budgetLabel
    }()
    
    private let budget: UILabel = {
        let budget = UILabel()
        budget.textColor = .lightGray
        budget.text = "$0"
        budget.textAlignment = .left
        budget.translatesAutoresizingMaskIntoConstraints = false
        budget.font = UIFont.boldSystemFont(ofSize: 13)
        return budget
    }()
    
    private let revenueLabel: UILabel = {
        let RevenueLabel = UILabel()
        RevenueLabel.textColor = .black
        RevenueLabel.text = "Revenue"
        RevenueLabel.translatesAutoresizingMaskIntoConstraints = false
        RevenueLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return RevenueLabel
    }()
    
    private let revenue: UILabel = {
        let revenue = UILabel()
        revenue.textColor = .lightGray
        revenue.text = "$0"
        revenue.textAlignment = .left
        revenue.translatesAutoresizingMaskIntoConstraints = false
        revenue.font = UIFont.boldSystemFont(ofSize: 13)
        return revenue
    }()
    
    
    private let overviewLabel: UILabel = {
        let overviewLabel = UILabel()
        overviewLabel.textColor = .black
        overviewLabel.text = "Overview"
        overviewLabel.textAlignment = .center
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return overviewLabel
    }()
    
    private let overview: UILabel = {
        let overview = UILabel()
        overview.textColor = .lightGray
        overview.textAlignment = .justified
        overview.lineBreakMode = .byWordWrapping
        overview.text = "Ridiculus mus mauris vitae ultricies leo integer malesuada. Faucibus interdum posuere lorem ipsum dolor. Quam pellentesque nec nam aliquam. Pellentesque habitant morbi tristique senectus et netus et. Vel pharetra vel turpis nunc eget lorem dolor sed. Ut faucibus pulvinar elementum integer enim neque volutpat ac. Neque viverra justo nec ultrices dui. Aenean et tortor at risus viverra. Morbi tincidunt ornare massa eget egestas. Mattis molestie a iaculis at erat pellentesque. Eget sit amet tellus cras. Accumsan in nisl nisi scelerisque eu. Mauris in aliquam sem fringilla."
        overview.numberOfLines = 0
        overview.translatesAutoresizingMaskIntoConstraints = false
        overview.font = UIFont.boldSystemFont(ofSize: 13)
        return overview
    }()
    
    let overviewContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupViewConstraints()
        getDetails()
    }
    
    private func addViews(){
        self.view.addSubview(releaseDateLabel)
        self.view.addSubview(overviewContainerView)
        self.view.addSubview(releaseDate)
        self.view.addSubview(languageLabel)
        self.view.addSubview(language)
        self.view.addSubview(budgetLabel)
        self.view.addSubview(budget)
        self.view.addSubview(overviewLabel)
        self.view.addSubview(overview)
        self.view.addSubview(revenueLabel)
        self.view.addSubview(revenue)
    }
    
    private func setupViewConstraints(){
        
        NSLayoutConstraint.activate([
            releaseDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor,constant:  70),
            
            releaseDate.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
            
            releaseDate.leftAnchor.constraint(equalTo: releaseDateLabel.leftAnchor),
            
            releaseDate.rightAnchor.constraint(equalTo: releaseDateLabel.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            languageLabel.leftAnchor.constraint(equalTo: releaseDateLabel.rightAnchor, constant: 50),

            language.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 8),

            language.leftAnchor.constraint(equalTo: languageLabel.leftAnchor),

            language.rightAnchor.constraint(equalTo: languageLabel.rightAnchor, constant: -20),
        ])
        
        
        NSLayoutConstraint.activate([
            budgetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            budgetLabel.leftAnchor.constraint(equalTo: languageLabel.rightAnchor, constant: 50),

            budget.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: 8),
            budget.leftAnchor.constraint(equalTo: budgetLabel.leftAnchor),
            budget.rightAnchor.constraint(equalTo: budgetLabel.rightAnchor),
        ])

        
        NSLayoutConstraint.activate([
            revenueLabel.topAnchor.constraint(equalTo: budget.bottomAnchor,constant: 3),
            revenueLabel.leftAnchor.constraint(equalTo: budgetLabel.leftAnchor),

            revenue.topAnchor.constraint(equalTo: revenueLabel.bottomAnchor, constant: 5),
            revenue.leftAnchor.constraint(equalTo: revenueLabel.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: revenue.bottomAnchor, constant: 5),
            overviewLabel.leftAnchor.constraint(equalTo: releaseDateLabel.leftAnchor),
        ])

        NSLayoutConstraint.activate([
            overview.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 15),
            overviewContainerView.leftAnchor.constraint(equalTo: overviewLabel.leftAnchor),
            overviewContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            overview.topAnchor.constraint(equalTo: overviewContainerView.topAnchor),
            overview.leftAnchor.constraint(equalTo: overviewContainerView.leftAnchor),
            overview.rightAnchor.constraint(equalTo: overviewContainerView.rightAnchor),
        ])
    }
    
    private func getDetails(){
        viewModel.getMovieDetails(id: movie?.id ?? -1) { result in
            switch result {
            case .success(let movieResult):
                self.movieDetals = movieResult
                self.setData()
            case .failure(let error):
                print("Error fetching movie details: \(error)")
            }
        }
    }
    
    private func setData(){
        releaseDate.text = movieDetals?.releaseDate ?? "uknown"
        if let languageText = movieDetals?.originalLanguage {
            language.text = languageText == "en" ? "English" : languageText
        } else {
            language.text = "Unknown"
        }

        budget.text = getFormattedMoneyText(money: movieDetals?.budget ?? -1)
        revenue.text = getFormattedMoneyText(money: movieDetals?.revenue ?? -1)
        overview.text = movieDetals?.overview
    }
    
    private func getFormattedMoneyText(money:Int)-> String{
        let x: Int = money
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let budgetText = numberFormatter.string(from: NSNumber(value: x)) ?? "Unknown"
        let formattedBudgetText = "$" + budgetText
        return formattedBudgetText
    }
}
