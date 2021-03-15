//
//  UITableView+EXT.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit


extension UITableView {
    func register(cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier())
    }
    
    func dequeueReusableCell(_ cell: UITableViewCell.Type) -> UITableViewCell {
        guard let newCell = dequeueReusableCell(withIdentifier: cell.reuseIdentifier()) else {
            return cell.init()
        }
        return newCell
    }
}
