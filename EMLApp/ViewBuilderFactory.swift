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
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        buildMainView()
    }
    
    func viewRequest(_ type: MenuType) {
        switch type {
        case .menu:
            self.navigationController.pushViewController(MenuViewController(), animated: true)
        case .report:
            self.navigationController.pushViewController(ReportViewController(), animated: true)
        case .detail:
            print("detail")
        }
    }
    
    private func buildMainView() {
        let mainViewController = MainViewController("Main")
        mainViewController.viewBuilder = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
}
