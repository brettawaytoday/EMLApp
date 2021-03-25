//
//  ReportViewControllerTests.swift
//  EMLAppTests
//
//  Created by Brett Christian on 23/03/21.
//

import UIKit
import XCTest
import EMLEngine
@testable import EMLApp

class ReportViewControllerTests: XCTestCase {
    
    func test_reportViewController_titleIsReport() {
        let sut = ReportViewController(reports: [])
        _ = sut.view
        XCTAssertEqual(sut.title, "Report")
    }
    
    func test_reportViewController_itemsCountIsCorrect() {
        let sut = ReportViewController(reports: [])
        _ = sut.view
        XCTAssertNotNil(sut.reports)
    }
    
    func test_reportViewController_tableView_hasDataSource() {
        let sut = ReportViewController(reports: [])
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
}
