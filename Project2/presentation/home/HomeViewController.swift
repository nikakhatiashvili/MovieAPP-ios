//
//  HomeViewController.swift
//  Project2
//
//  Created by user on 7/21/23.
//

import Foundation
import FirebaseAuth
import Resolver
import UIKit

class HomeViewController:UIViewController{
    
    @LazyInjected private var viewModel: HomeViewModel
    
    private let textview : UILabel = {
        let textview = UILabel()
        textview.text = ""
        textview.textColor = .systemRed
        return textview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        viewModel.getPopularMovies(completion: {_,_ in})
        self.view.backgroundColor = .white
    }
    
    private func setupUI(){
        self.view.addSubview(textview)
        textview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        textview.text = "welcome: " + (Auth.auth().currentUser?.email ?? "")
    }
    
}

