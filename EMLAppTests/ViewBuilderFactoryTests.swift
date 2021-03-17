//
//  ViewBuilderFactory.swift
//  EMLAppTests
//
//  Created by Brett Christian on 16/03/21.
//

import XCTest
@testable import EMLApp

class ViewBuilderFactoryTests: XCTestCase {

    func test_viewBuilder_buildsMainAndMenuViewControllers_AndStacksViewControllersCorrectly() {
        let sut = makeSUT()
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        sut.viewRequest(.menu)
        XCTAssertEqual(sut.navigationController.viewControllers.count, 2)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == MenuViewController<String>.self)
    }
    
    func test_viewBuilder_buildsMainAndReportViewControllers_AndStacksViewControllersCorrectly() {
        let sut = makeSUT()
        sut.viewRequest(.report)
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == ReportViewController.self)
    }
    
    func test_viewBuilder_buildsMainAndDetailViewControllers_AndStacksViewControllersCorrectly() {
        let sut = makeSUT()
        sut.viewRequest(.detail)
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == DetailsViewController.self)
    }
    
    func makeSUT() -> ViewBuilderFactory {
        return ViewBuilderFactory(with: SpyNavigationController(), with: makeMenu())
    }
    
    func makeMenu() -> Menu {
        return MainMenu(menuItems: [MenuItem(title: "T1", description: "D1", type: .menu)])
    }

}

class SpyNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
