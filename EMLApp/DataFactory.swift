//
//  DataFactory.swift
//  EMLApp
//
//  Created by Brett Christian on 18/03/21.
//

import Foundation
import EMLEngine

class DataFactory<T> {
    
    var dataManager: DataManager?
    
    func dataForType(_ type: MenuData) -> T? {
        switch type {
        case .school:
            guard let data = dataManager?.getSchools() as? T else { return nil }
            return data
        case .classroom:
            guard let data = dataManager?.getClassrooms() as? T else { return nil }
            return data
        case .meal:
            guard let data = dataManager?.getMeals() as? T else { return nil }
            return data
        case .schoolReport:
            return dataManager?.getReport() as? T
        case .classroomReport:
            return dataManager?.getReport() as? T
        case .mealReport:
            return dataManager?.getReport() as? T
        case .kitchenReport:
            return nil
        case .distributionReport:
            return nil
        case .packagingReport:
            guard let data = dataManager?.getPackaging() as? T else { return nil }
            return data
        }
    }
    
    func fetchReport() -> Report? {
        return dataManager?.getReport()
    }
    
}
