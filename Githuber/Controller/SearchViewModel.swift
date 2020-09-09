//
//  SearchViewModel.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxCocoa
import RxSwift

final class SearchViewModel: BaseViewModel {
    
    var title: Observable<String> {
        .just("Search Repo")
    }
}
