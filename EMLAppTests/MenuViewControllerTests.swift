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
        let cell = sut.populate(UITableViewCell(), with: School("School1"))
        
        XCTAssertEqual(cell.textLabel?.text, "School1")
    }
    
    func test_populateCell_withClassroom_returnsCorrectCellText() {
        let sut = makeSUT()
        let cell = sut.populate(UITableViewCell(), with: Classroom("Classroom1"))
        
        XCTAssertEqual(cell.textLabel?.text, "Classroom1")
    }
    
    func test_populateCell_withMeal_returnsCorrectCellText() {
        let sut = makeSUT()
        let cell = sut.populate(UITableViewCell(), with: Meal(.regular, dietaries: []))
        
        XCTAssertEqual(cell.textLabel?.text, "Regular")
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

