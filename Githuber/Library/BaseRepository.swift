//
//  BaseRepository.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import Moya
import RxSwift

class BaseRepository<Target: TargetType> {
    
    var provider = MoyaProvider<Target>.withNetworkLoggerPlugin(otherPlugins: [])

}
