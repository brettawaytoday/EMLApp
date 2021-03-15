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
    
    func dequeueReusableCell(_ cell: UITableViewCell.Type, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: cell.reuseIdentifier(), for: indexPath)
    }
}
