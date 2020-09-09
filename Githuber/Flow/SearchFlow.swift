//
//  SearchFlow.swift
//  Githuber
//
//  Created by Meng Li on 2020/09/09.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxFlow

enum SearchStep: Step {
    case start
    case result
}

class SearchFlow: Flow {
    
    var root: Presentable {
        UIViewController()
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let searchStep = step as? SearchStep else {
            return .none
        }
        
        return .none
    }
}
