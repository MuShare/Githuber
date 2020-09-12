//
//  XCUIApplication+Mock.swift
//  GithuberUITests
//
//  Created by Meng Li on 2020/9/11.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import XCTest
@testable import Githuber

extension XCUIApplication {
    static var mockApp: XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["test"]
        return app
    }
}
