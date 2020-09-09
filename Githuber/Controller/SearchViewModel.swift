//
//  SearchViewModel.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxCocoa
import RxDataSourcesSingleSection
import RxSwift

final class SearchViewModel: BaseViewModel {
    
    private let keywordRelay = BehaviorRelay<String?>(value: nil)
    private let repositoryItems = BehaviorRelay<[RepositoryItem]>(value: [])
    
    override init() {
        super.init()
        
    }
    
    func observeKeyword() {
        keywordRelay
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .distinctUntilChanged().debug()
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .flatMapLatest { SearchManager.shared.searchRepo(keyword: $0) }.debug()
            .asDriver(onErrorJustReturn: [])
            .drive(repositoryItems)
            .disposed(by: disposeBag)
    }
    
    var title: Observable<String> {
        .just("Search Repo")
    }
    
    var keyword: BehaviorRelay<String?> {
        keywordRelay
    }
    
    var repositoryItemSection: Observable<SingleSection<RepositoryItem>> {
        repositoryItems.map {
            SingleSection.create($0)
        }
    }
    
    func pick(at index: Int) {
        guard repositoryItems.value.isSafe(for: index) else {
            return
        }
        steps.accept(SearchStep.repository(repositoryItems.value[index]))
    }
}
