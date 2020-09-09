//
//  AppFlow.swift
//  Githuber
//
//  Created by Meng Li on 2020/09/09.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxSwift
import RxFlow

enum AppStep: Step {
    case search
}

class AppFlow: Flow {
    
    var root: Presentable {
        return rootWindow
    }
    
    private let rootWindow: UIWindow
    
    private lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        controller.view.backgroundColor = .white
        return controller
    }()
    
    init(window: UIWindow) {
        rootWindow = window
        rootWindow.backgroundColor = .white
        rootWindow.rootViewController = navigationController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let appStep = step as? AppStep else {
            return  .none
        }
        switch appStep {
        case .search:
            let search = SearchFlow()
            Flows.use(search, when: .ready) {
                self.navigationController.pushViewController($0, animated: false)
            }
            return .flow(search, with: SearchStep.start)
        }
    }
    
}
