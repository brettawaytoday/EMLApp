//
//  EMLAppTests.swift
//  EMLAppTests
//
//  Created by Brett Christian on 15/03/21.
//

import XCTest
@testable import EMLApp

class EMLAppTests: XCTestCase {

    func test_mainViewController_rendersTitle() {
        XCTAssertEqual(makeSUT().title, "Main")
    }
    
    func test_tableViewDatasource_notNil() {
        XCTAssertNotNil(makeSUT().tableView.dataSource)
    }
    
    func test_tableViewDelegate_notNil() {
        XCTAssertNotNil(makeSUT().tableView.delegate)
    }
    
    func test_tableView_hasRows() {
        XCTAssertTrue((makeSUT().tableView.numberOfRows(inSection: 0)) == 1)
    }
    
    func test_tableViewCell_hasCorrectReuseIdentifier() {
        let controller = makeSUT()
        XCTAssertEqual(controller.tableView.dataSource?.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0)).reuseIdentifier, UITableViewCell.reuseIdentifier())
    }
    
    func test_tableView_viewSizeEqualsDeviceView() {
        let controller = makeSUT()
        XCTAssertEqual(controller.tableView.frame.width, controller.view.bounds.width)
        XCTAssertEqual(controller.tableView.frame.height, controller.view.bounds.height)
    }
    
    
    //MARK: Helpers
    
    func makeSUT() -> MainViewController {
        let controller = MainViewController()
        _ = controller.view
        return controller
    }

}
