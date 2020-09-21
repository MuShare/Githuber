//
//  MoyaProvider+Extension.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import Moya

extension MoyaProvider {
    
    static func withNetworkLoggerPlugin(otherPlugins: [PluginType] = []) -> MoyaProvider {
        #if DEBUG
        return MoyaProvider<Target>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))] + otherPlugins)
        #else
        return MoyaProvider<Target>(plugins: otherPlugins)
        #endif
    }
    
}
