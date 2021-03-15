//
//  ViewBuilderFactory.swift
//  EMLApp
//
//  Created by Brett Christian on 16/03/21.
//

import UIKit

protocol ViewBuilderDelegate {
   func viewRequest(_ type: MenuType)
}

class ViewBuilderFactory: ViewBuilderDelegate {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func viewRequest(_ type: MenuType) {
        switch type {
        case .menu:
            print("menu")
        case .report:
            print("report")
        case .detail:
            print("detail")
        }
    }
    
    func buildMainView() -> MainViewController {
        let mainViewController = MainViewController("Main")
        mainViewController.delegate = self
        return mainViewController
    }
}
