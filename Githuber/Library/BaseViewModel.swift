//
//  BaseViewModel.swift
//  Githuber
//
//  Created by Meng Li on 2020/09/09.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxAlertViewable
import RxController
import RxSwift

class BaseViewModel: RxViewModel {
    
    let alert = PublishSubject<RxAlert>()
    let actionSheet = PublishSubject<RxActionSheet>()
    
}
