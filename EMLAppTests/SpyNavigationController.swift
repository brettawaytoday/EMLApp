//
//  ApyNavigationController.swift
//  EMLAppTests
//
//  Created by Brett Christian on 23/03/21.
//

import UIKit


class SpyNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
