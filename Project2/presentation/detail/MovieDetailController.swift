//
//  MovieDetailController.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import UIKit

class MovieDetailController: UIViewController {
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi(){
        self.view.backgroundColor = .white
        print(movie?.title ?? "")
    }
}
