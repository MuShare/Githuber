//
//  SearchRepositoryTests.swift
//  GithuberTests
//
//  Created by Meng Li on 2020/9/10.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxBlocking
import XCTest
@testable import Githuber

class SearchRepositoryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        SearchRepository.shared.mock()
    }

    override class func tearDown() {
        super.tearDown()
    }

    func testSearchRepo() {
        let repositoryItems = try! SearchRepository.shared.searchRepo(keyword: "RxAlertViewable").toBlocking().first()
        let expected = [
            RepositoryItem(
                fullName: "lm2343635/RxAlertViewable",
                language: "Swift",
                description: "A simple alert library with RxSwift MVVM supported.",
                owner: Owner(
                    login: "lm2343635",
                    avatarUrl: "https://avatars0.githubusercontent.com/u/9463655?v=4"
                ),
                name: "RxAlertViewable",
                stargazersCount: 12,
                forksCount: 2,
                watchersCount: 12,
                openIssuesCount: 0
            )
        ]
        XCTAssertEqual(repositoryItems, expected)
    }

}
