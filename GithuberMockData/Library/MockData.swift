//
//  MockData.swift
//  GithuberMockData
//
//  Created by Meng Li on 2020/9/10.
//  Copyright © 2020 Meng Li. All rights reserved.
//

class MockData {
    static func getMockData(name: String) -> Data {
        guard
            let dataUrl = Bundle(for: Self.self).url(forResource: name, withExtension: "json"),
            let data = try? Data(contentsOf: dataUrl)
        else {
            fatalError("Mock data not found.")
        }
        return data
    }
}
