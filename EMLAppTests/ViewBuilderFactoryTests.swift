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
        let sut = ViewBuilderFactory()
        XCTAssertEqual(sut.buildMainView().title, "Main")
    }

}
