//
//  MenuViewControllerTests.swift
//  EMLAppTests
//
//  Created by Brett Christian on 17/03/21.
//

import XCTest
import EMLEngine
@testable import EMLApp
@testable import EMLEngine

class MenuViewControllerTests: XCTestCase {
    
    func test_tableViewDatasource_notNil() {
        XCTAssertNotNil(makeSUT().tableView.dataSource)
    }
    
    func test_tableViewDelegate_notNil() {
        XCTAssertNotNil(makeSUT().tableView.delegate)
    }
    
    func test_tableView_hasRows() {
        let sut = makeSUT()
        XCTAssertEqual((sut.tableView.numberOfRows(inSection: 0)), 1)
    }
    
    func test_menuViewItems_notNil() {
        XCTAssertEqual(makeSUT().items.count, 1)
    }
    
    func test_tableView_viewSizeEqualsDeviceView() {
        let controller = makeSUT()
        XCTAssertEqual(controller.tableView.frame.width, controller.view.bounds.width)
        XCTAssertEqual(controller.tableView.frame.height, controller.view.bounds.height)
    }
    
    func test_populateCell_withSchool_returnsCorrectCellText() {
        let sut = makeSUT()
        
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell?.textLabel?.text, "School")
    }
    
    func test_populateCell_withClassroom_returnsCorrectCellText() {
        let classrooms = [Classroom("Classroom")]
        let sut = MenuViewController<Classroom>(classrooms)
        _ = sut.view
        
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell?.textLabel?.text, "Classroom")
    }
    
    func test_populateCell_withMeal_returnsCorrectCellText() {
        let meals = [Meal(.regular, dietaries: [])]
        let sut = MenuViewController<Meal>(meals)
        _ = sut.view
        
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell?.textLabel?.text, "Regular")
    }
    
    func test_populateCell_withString_returnsCorrectCellText() {
        let strings = [""]
        let sut = MenuViewController<String>(strings)
        _ = sut.view
        
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell?.textLabel?.text, "")
    }

    
    //MARK: Helpers
    
    func makeSUT() -> MenuViewController<School> {
        let school = School("School")
        let schools = [school]
        let controller = MenuViewController<School>(schools)
        _ = controller.view
        return controller
    }
}

