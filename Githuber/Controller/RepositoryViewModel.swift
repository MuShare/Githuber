//
//  RepositoryViewModel.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxCocoa
import RxSwift

final class RepositoryViewModel: BaseViewModel {
    
    private let repositoryItem: BehaviorRelay<RepositoryItem>
    
    init(item: RepositoryItem) {
        repositoryItem = BehaviorRelay(value: item)
        super.init()
    }
    
    var ownerAvatar: Observable<URL?> {
        repositoryItem.map {
            guard let avatarUrl = $0.owner.avatarUrl else {
                return nil
            }
            return URL(string: avatarUrl)
        }
    }
    
    var ownerLogin: Observable<String?> {
        repositoryItem.map { $0.owner.login }
    }
    
    var fullName: Observable<String?> {
        repositoryItem.map { $0.fullName }
    }
    
    var descriptionString: Observable<String?> {
        repositoryItem.map { $0.description }
    }
}
