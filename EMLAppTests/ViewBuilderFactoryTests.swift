//
//  ViewBuilderFactory.swift
//  EMLAppTests
//
//  Created by Brett Christian on 16/03/21.
//

import XCTest
@testable import EMLApp

class ViewBuilderFactoryTests: XCTestCase {

    func test_buildMainView() {
        let navigationController = UINavigationController()
        let sut = ViewBuilderFactory(navigationController)
        XCTAssertEqual(sut.buildMainView().title, "Main")
    }
    
    func test_buildMainView_confirmDelegateIsSelf() {
        let navigationController = UINavigationController()
        let sut = ViewBuilderFactory(navigationController)
        XCTAssertNotNil(sut.buildMainView().delegate)
    }

}
