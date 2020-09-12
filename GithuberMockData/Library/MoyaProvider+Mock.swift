//
//  MoyaProvider+Mock.swift
//  GithuberMockData
//
//  Created by Meng Li on 2020/9/11.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import Moya

extension MoyaProvider {
    
    public static func mockProvider() -> MoyaProvider {
        return MoyaProvider(
            endpointClosure: { target in
                return Endpoint(
                    url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                    sampleResponseClosure: {
                        .networkResponse(200, target.sampleData)
                    },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields:
                    target.headers
                )
            },
            stubClosure: { _ in
                .immediate
            },
            plugins: [
                NetworkLoggerPlugin.init(configuration: .init(logOptions: .verbose))
            ]
        )
    }
    
}
