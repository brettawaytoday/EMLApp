//
//  Menu.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import Foundation

protocol Menu {
    var menuItems: [MenuItem] { get }
    mutating func addMenuItem(_ menuItem: MenuItem)
    mutating func addMenuItems(_ menuItems: [MenuItem])
}

struct MainMenu: Menu {
    var menuItems: [MenuItem] = []
    
    mutating func addMenuItem(_ menuItem: MenuItem) {
        self.menuItems.append(menuItem)
    }
    
    mutating func addMenuItems(_ menuItems: [MenuItem]) {
        self.menuItems.append(contentsOf: menuItems)
    }
}
