//
//  Stub.swift
//  GithuberTests
//
//  Created by Meng Li on 2020/9/10.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {
    func getMockData(name: String) -> Data? {
        guard let dataUrl = Bundle(for: type(of: self)).url(forResource: name, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: dataUrl)
    }
}
