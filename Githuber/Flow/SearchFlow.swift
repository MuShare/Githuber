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
    case repository(RepositoryItem)
}

class SearchFlow: Flow {
    
    var root: Presentable {
        searchViewController
    }
    
    private lazy var searchViewController = SearchViewController(viewModel: .init())
    
    private var navigationController: UINavigationController? {
        searchViewController.navigationController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let searchStep = step as? SearchStep else {
            return .none
        }
        switch searchStep {
        case .start:
            return .viewController(searchViewController)
        case .repository(let item):
            let repositoryViewController = RepositoryViewController(viewModel: .init(item: item))
            navigationController?.pushViewController(repositoryViewController, animated: true)
            return .none
        }
    }
    
}
