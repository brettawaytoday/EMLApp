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
    var navigationController = UINavigationController()
    
    init(with navigationController: UINavigationController, with menu: Menu) {
        self.navigationController = navigationController
        buildMainView(with: menu)
    }
    
    func viewRequest(_ type: MenuType) {
        switch type {
        case .menu:
            self.navigationController.pushViewController(MenuViewController(), animated: true)
        case .report:
            self.navigationController.pushViewController(ReportViewController(), animated: true)
        case .detail:
            self.navigationController.pushViewController(DetailsViewController(), animated: true)
        }
    }
    
    private func buildMainView(with menu: Menu) {
        let mainViewController = MainViewController("Main")
        mainViewController.menu = menu
        mainViewController.viewBuilder = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
}



