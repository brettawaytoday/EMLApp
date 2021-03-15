//
//  UITableView+EXT.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit


extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier())
    }
    
    func dequeueResusableCell<T: UITableViewCell>(ofType cell: T.Type, at indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cell.reuseIdentifier(), for: indexPath) as! T
    }
}
