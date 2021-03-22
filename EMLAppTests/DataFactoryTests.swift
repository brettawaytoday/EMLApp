//
//  DataFactoryTests.swift
//  EMLAppTests
//
//  Created by Brett Christian on 17/03/21.
//

import Foundation
import XCTest
import EMLEngine
@testable import EMLApp


class DataFactoryTests: XCTestCase {
    
    func test_requestForSchool_returnsSchoolObject() {
        let builder = SpyBuilder()
        let sut = DataFactory<Any>()
        sut.dataManager = builder.dataManager
        XCTAssertNotNil(sut.dataForType(.school))
        XCTAssertNotNil(sut.dataForType(.classroom))
        XCTAssertNotNil(sut.dataForType(.meal))
    }
    
    func test_requestForSchool_withIncorrectDataFactory_returnsNil() {
        let builder = SpyBuilder()
        let sut = DataFactory<School>()
        sut.dataManager = builder.dataManager
        XCTAssertNil(sut.dataForType(.school))
        XCTAssertNil(sut.dataForType(.classroom))
        XCTAssertNil(sut.dataForType(.meal))
    }
    
}
