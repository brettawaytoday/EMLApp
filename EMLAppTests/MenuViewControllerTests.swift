//
//  MenuViewControllerTests.swift
//  EMLAppTests
//
//  Created by Brett Christian on 17/03/21.
//

import XCTest
@testable import EMLApp

class MenuViewControllerTests: XCTestCase {
    
    func test_tableViewDatasource_notNil() {
        XCTAssertNotNil(makeSUT().tableView.dataSource)
    }
    
    func test_tableViewDelegate_notNil() {
        XCTAssertNotNil(makeSUT().tableView.delegate)
    }
    
    func test_tableView_hasRows() {
        let sut = makeSUT(with: ["item"])
        XCTAssertEqual((sut.tableView.numberOfRows(inSection: 0)), 1)
    }
    
    func test_tableViewCell_hasCorrectTextLabelText() {
        let controller = makeSUT(with: ["item"])
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel?.text, "item")
        XCTAssertEqual(controller.tableView.dataSource?.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0)).reuseIdentifier, UITableViewCell.reuseIdentifier())
    }
    
    func test_tableView_viewSizeEqualsDeviceView() {
        let controller = makeSUT()
        XCTAssertEqual(controller.tableView.frame.width, controller.view.bounds.width)
        XCTAssertEqual(controller.tableView.frame.height, controller.view.bounds.height)
    }

    
    //MARK: Helpers
    
    func makeSUT(with items: [String] = []) -> MenuViewController<String> {
        let controller = MenuViewController<String>(items)
        _ = controller.view
        return controller
    }
}
