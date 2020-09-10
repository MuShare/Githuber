//
//  BaseRepository.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import GithuberMockData
import Moya
import RxSwift

class BaseRepository<Target: TargetType> {
    
    var provider: MoyaProvider<Target> = {
        if CommandLine.arguments.contains("test") {
            return MoyaProvider<Target>.mockProvider()
        } else {
            return MoyaProvider<Target>.withNetworkLoggerPlugin(otherPlugins: [])
        }
    }()

    func mock() {
        provider = MoyaProvider<Target>.mockProvider()
    }
    
}
