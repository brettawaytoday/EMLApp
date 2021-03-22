//
//  MenuItem.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import Foundation

struct MenuItem {
    var title: String
    var description: String
    var type: MenuType
    var dataType: MenuData
}

enum MenuType {
    case menu, report, detail
}

enum MenuData {
    case school, classroom, meal, schoolReport, classroomReport, mealReport, kitchenReport, distributionReport
}
