//
//  EMLBuilders.swift
//  EMLApp
//
//  Created by Brett Christian on 16/03/21.
//

import Foundation

class EMLBuilders {
    static let mainMenu = MainMenu(menuItems: [
        MenuItem(title: "Schools", description: "A list of all the schools.", type: .menu),
        MenuItem(title: "Classrooms", description: "A list of all the classrooms in all the schools.", type: .menu),
        MenuItem(title: "Meals", description: "All meals for all the schools.", type: .menu),
        MenuItem(title: "School Report", description: "Packing report for all the schools.", type: .report),
        MenuItem(title: "Classroom Report", description: "A packing report for all the classrooms.", type: .report),
        MenuItem(title: "Disribution Report", description: "A report showing all distribution details for meals.", type: .report),
        MenuItem(title: "Kitchen Report", description: "A breakdown of quantities of each meal type.", type: .report)
    ])
}
