//
//  TabViewController.swift
//  Project2
//
//  Created by user on 8/1/23.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
    
    var movie:Movie?

    private var childLeft: UIViewController {
        let vc = InfoController()
        vc.movie = movie
        return vc
    }

    private var childRight: UIViewController {
        let vc = ReviewsController()
        vc.movie = movie
        return vc
    }
    
    private var tooRight: UIViewController {
        let vc = CastViewController()
        vc.movie = movie
        return vc
    }
    
    private lazy var viewControllers: [UIViewController] = [childLeft, childRight,tooRight]

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.indicator.tintColor = .systemPink

        bar.buttons.customize { button in
            button.tintColor = .gray
            button.selectedTintColor = .systemPink
        }

        addBar(bar, dataSource: self, at: .top)
    }
}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        var title = ""
        if index == 0 {
            title = "Info"
        }
        if index == 1 {
            title = "Reviews"
        }
        if index == 2 {
            title = "Cast"
        }
        return TMBarItem(title: title)
    }
}
