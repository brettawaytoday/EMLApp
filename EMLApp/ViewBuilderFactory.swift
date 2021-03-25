//
//  ViewBuilderFactory.swift
//  EMLApp
//
//  Created by Brett Christian on 16/03/21.
//

import UIKit
import EMLEngine

protocol ViewBuilderDelegate {
   func viewRequest(_ forType: MenuItem)
}

class ViewBuilderFactory: ViewBuilderDelegate {
    var navigationController = UINavigationController()
    
    var dataFactory: DataFactory<Any>?
    
    let mainViewController: MainViewController = MainViewController("Main")
    
    init(with navigationController: UINavigationController, with menu: Menu) {
        self.navigationController = navigationController
        buildMainView(with: menu)
        dataFactory = DataFactory<Any>()
    }
    
    func viewRequest(_ menuItem: MenuItem) {
        switch menuItem.dataType {
        case .school:
            if let data: [School] = fetchData(for: [School].self, for: menuItem) {
                completeViewRequest(with: data, for: menuItem)
            }
        case .classroom:
            if let data: [Classroom] = fetchData(for: [Classroom].self, for: menuItem) {
                completeViewRequest(with: data, for: menuItem)
            }
        case .meal:
            if let data: [Meal] = fetchData(for: [Meal].self, for: menuItem) {
                completeViewRequest(with: data, for: menuItem)
            }
        case .schoolReport:
            if let report: ReportGenerator = dataFactory?.fetchReport() as? ReportGenerator {
                let schools = report.schools
                self.navigationController.pushViewController(ReportViewController(reports: schools), animated: true)
            }
        case .classroomReport:
            if let report: ReportGenerator = dataFactory?.fetchReport() as? ReportGenerator {
                let classrooms = report.classrooms
                self.navigationController.pushViewController(ReportViewController(reports: classrooms), animated: true)
            }
        case .mealReport:
            print("")
        case .kitchenReport:
            print("")
        case .distributionReport:
            print("")
        case .packagingReport:
            if let data: [Packaging] = fetchData(for: [Packaging].self, for: menuItem) {
                completeViewRequest(with: data, for: menuItem)
            }
        }
    }
    
    
    private func fetchData<T>(for type: T.Type, for dataType: MenuItem) -> T? {
        return dataFactory?.dataForType(dataType.dataType) as? T
    }
    
    private func completeViewRequest<T>(with data: [T], for menuItem: MenuItem) {
        switch menuItem.type {
        case .menu:
            self.navigationController.pushViewController(MenuViewController<T>(data), animated: true)
        case .report:
            guard let report = data as? [Report] else { return }
            self.navigationController.pushViewController(ReportViewController(reports: report), animated: true)
        case .detail:
            self.navigationController.pushViewController(DetailsViewController(), animated: true)
        }
    }
    
    private func buildMainView(with menu: Menu) {
        mainViewController.menu = menu
        mainViewController.viewBuilder = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
}



