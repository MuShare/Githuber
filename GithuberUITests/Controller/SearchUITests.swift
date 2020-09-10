//
//  SearchViewControllerUITests.swift
//  GithuberUITests
//
//  Created by Meng Li on 2020/9/10.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import XCTest
@testable import Githuber

class SearchUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launch()
        
        let searchBar = app.searchFields["Search Github Repository"]
        searchBar.tap()
        sleep(1)
        searchBar.typeText("RxAlertViewable")
        sleep(5)
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearch() {
        XCTAssertEqual(app.cells.count, 1)
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertNotNil(firstCell.staticTexts["lm2343635/RxAlertViewable"].label)
        XCTAssertNotNil(firstCell.staticTexts["Swift"].label)
    }
    
    func testShowRepository() {
        let firstCell = app.cells.element(boundBy: 0)
        firstCell.tap()
        sleep(1)
    }

}
