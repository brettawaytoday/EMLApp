//
//  EMLAppTests.swift
//  EMLAppTests
//
//  Created by Brett Christian on 15/03/21.
//

import XCTest
@testable import EMLApp

class MainViewControllerTests: XCTestCase {

    func test_mainViewController_rendersTitle() {
        XCTAssertEqual(makeSUT("Main").title, "Main")
    }
    
    func test_tableViewDatasource_notNil() {
        XCTAssertNotNil(makeSUT().tableView.dataSource)
    }
    
    func test_tableViewDelegate_notNil() {
        XCTAssertNotNil(makeSUT().tableView.delegate)
    }
    
    func test_tableView_hasRows() {
        let sut = makeSUT(with: [MenuItem(title: "T1", description: "D1", type: .menu, dataType: .school)])
        XCTAssertEqual((sut.tableView.numberOfRows(inSection: 0)), 1)
    }
    
    func test_tableViewCell_hasCorrectTextLabelText() {
        let controller = makeSUT(with: [MenuItem(title: "T1", description: "D1", type: .menu, dataType: .school)])
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel?.text, "T1")
        XCTAssertEqual(controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.detailTextLabel?.text, "D1")
        XCTAssertEqual(controller.tableView.dataSource?.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0)).reuseIdentifier, MenuCell.reuseIdentifier())
    }
    
    func test_tableView_viewSizeEqualsDeviceView() {
        let controller = makeSUT()
        XCTAssertEqual(controller.tableView.frame.width, controller.view.bounds.width)
        XCTAssertEqual(controller.tableView.frame.height, controller.view.bounds.height)
    }

    
    //MARK: Helpers
    
    func makeSUT(_ title: String = "", with menuItems: [MenuItem] = []) -> MainViewController {
        let controller = MainViewController(title, with: menuItems)
        _ = controller.view
        return controller
    }
}
