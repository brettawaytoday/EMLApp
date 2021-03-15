//
//  UITableViewCell+EXT.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit


extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
}
