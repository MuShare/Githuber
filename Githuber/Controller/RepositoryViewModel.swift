//
//  RepositoryViewModel.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxCocoa
import RxDataSourcesSingleSection
import RxSwift

final class RepositoryViewModel: BaseViewModel {
    
    private let repositoryItem: BehaviorRelay<RepositoryItem>
    private let selections = BehaviorRelay<[Selection]>(value: [])
    
    init(item: RepositoryItem) {
        repositoryItem = BehaviorRelay(value: item)
        super.init()
        
        repositoryItem.asDriver()
            .map {
                return [
                    Selection(
                        icon: R.image.repository_star(),
                        title: R.string.localizable.repository_stars(),
                        subtitle: $0.stargazersCount?.description ?? "0",
                        accessory: .disclosureIndicator
                    ),
                    Selection(
                        icon: R.image.repository_fork(),
                        title: R.string.localizable.repository_forks(),
                        subtitle: $0.forksCount?.description ?? "0",
                        accessory: .disclosureIndicator
                    ),
                    Selection(
                        icon: R.image.repository_issue(),
                        title: R.string.localizable.repository_issues(),
                        subtitle: $0.openIssuesCount?.description ?? "0",
                        accessory: .disclosureIndicator
                    ),
                    Selection(
                        icon: R.image.repository_watcher(),
                        title: R.string.localizable.repository_wachters(),
                        subtitle: $0.watchersCount?.description ?? "0",
                        accessory: .disclosureIndicator
                    ),
                    Selection(
                        icon: R.image.repository_pull_request(),
                        title: R.string.localizable.repository_pull_requests(),
                        accessory: .disclosureIndicator
                    ),
                ]
            }
            .drive(selections)
            .disposed(by: disposeBag)
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
        repositoryItem.map { $0.name }
    }
    
    var descriptionString: Observable<String?> {
        repositoryItem.map { $0.description }
    }
    
    var selectionSelection: Observable<SingleSection<Selection>> {
        selections.map { SingleSection.create($0) }
    }
}
