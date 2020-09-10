//
//  SearchRepositoryTests.swift
//  GithuberTests
//
//  Created by Meng Li on 2020/9/10.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import Moya
import RxBlocking
import XCTest
@testable import Githuber

class SearchRepositoryTests: BaseTestCase {

    override func setUp() {
        super.setUp()
        
        guard let data = getMockData(name: "search_repositories") else {
            fatalError("Mock data not found.")
        }
        SearchRepository.shared.provider = MoyaProvider<SearchTarget>(
            endpointClosure: { target in
                let url = target.baseURL.appendingPathComponent(target.path).absoluteString
                switch target {
                case .searchRepo:
                    return Endpoint(
                        url: url,
                        sampleResponseClosure: {
                            .networkResponse(200, data)
                        },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields:
                        target.headers
                    )
                }
            },
            stubClosure: {
                switch $0 {
                case .searchRepo:
                    return .immediate
                }
            },
            plugins: [
                NetworkLoggerPlugin.init(configuration: .init(logOptions: .verbose))
            ]
        )
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
