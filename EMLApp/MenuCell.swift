//
//  MenuCell.swift
//  EMLApp
//
//  Created by Brett Christian on 16/03/21.
//

import UIKit

class MenuCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
