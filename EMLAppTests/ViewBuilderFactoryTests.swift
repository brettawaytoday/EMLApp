//
//  ViewBuilderFactory.swift
//  EMLAppTests
//
//  Created by Brett Christian on 16/03/21.
//

import XCTest
import EMLEngine
@testable import EMLApp
@testable import EMLEngine

class ViewBuilderFactoryTests: XCTestCase {

    func test_viewBuilder_buildsMainAndMenuViewControllers_AndStacksViewControllersCorrectly() {
        let sut = makeSUT()
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        sut.viewRequest(MenuItem(title: "", description: "", type: .menu, dataType: .school))
        XCTAssertEqual(sut.navigationController.viewControllers.count, 2)
        XCTAssertTrue(type(of: sut.navigationController.viewControllers.first!) == MainViewController.self)
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == MenuViewController<School>.self)
    }
    
    func test_viewBuilder_buildsMainViewController_withClassroomMenuViewRequest_stacksViewControllersCorrectly() {
        let sut = makeSUT()
        sut.viewRequest(MenuItem(title: "", description: "", type: .menu, dataType: .classroom))
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == MenuViewController<Classroom>.self)
    }
    
    func test_viewBuilder_buildsMainViewController_withMealMenuViewRequest_stacksViewControllersCorrectly() {
        let sut = makeSUT()
        sut.viewRequest(MenuItem(title: "", description: "", type: .menu, dataType: .meal))
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == MenuViewController<Meal>.self)
    }

    func test_viewBuilder_buildsMainAndReportViewControllers_AndStacksViewControllersCorrectly() {
        let sut = makeSUT()
        sut.viewRequest(MenuItem(title: "", description: "", type: .report, dataType: .school))
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == ReportViewController.self)
    }

    func test_viewBuilder_buildsMainAndDetailViewControllers_AndStacksViewControllersCorrectly() {
        let sut = makeSUT()
        sut.viewRequest(MenuItem(title: "", description: "", type: .detail, dataType: .school))
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == DetailsViewController.self)
    }
    
    func test_viewBuilder_buildsMainAndReportViewControllers_forPackagingReport() {
        let sut = makeSUT()
        sut.viewRequest(MenuItem(title: "", description: "", type: .report, dataType: .packagingReport))
        XCTAssertTrue(type(of: sut.navigationController.topViewController!) == ReportViewController.self)
    }

    func makeSUT() -> ViewBuilderFactory {
        let holder = SpyBuilder()
        let viewBuilder = ViewBuilderFactory(with: SpyNavigationController(), with: makeMenu())
        viewBuilder.dataFactory?.dataManager = holder.dataManager
        return viewBuilder
    }

    func makeMenu() -> Menu {
        return MainMenu(menuItems: [MenuItem(title: "T1", description: "D1", type: .menu, dataType: .school)])
    }

}




