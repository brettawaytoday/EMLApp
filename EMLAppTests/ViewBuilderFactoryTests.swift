//
//  ViewBuilderFactory.swift
//  EMLAppTests
//
//  Created by Brett Christian on 16/03/21.
//

import XCTest
@testable import EMLApp

class ViewBuilderFactoryTests: XCTestCase {

    let sut = ViewBuilderFactory(with: SpyNavigationController())
    
    func test_viewBuilder_buildsMainAndMenuViewControllers_AndStacksViewControllersCorrectly() {
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        sut.viewRequest(.menu)
        XCTAssertEqual(sut.navigationController.viewControllers.count, 2)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == MenuViewController.self)
    }
    
    func test_viewBuilder_buildsMainAndReportViewControllers_AndStacksViewControllersCorrectly() {
        sut.viewRequest(.report)
        XCTAssertEqual(sut.navigationController.viewControllers.count, 2)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == ReportViewController.self)
    }


}

class SpyNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
