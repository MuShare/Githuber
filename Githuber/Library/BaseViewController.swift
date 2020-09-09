//
//  BaseViewController.swift
//  Githuber
//
//  Created by Meng Li on 2020/09/09.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxAlertViewable
import RxController

class BaseViewController<ViewModel: BaseViewModel>: RxViewController<ViewModel> {
    
    var isNavigationBarHidden: Bool = false {
        didSet {
            navigationController?.isNavigationBarHidden = isNavigationBarHidden
        }
    }
    
    /**
     * This property indicates whether this controller is a child view controller of another controller.
     * If the property is false, the isNavigationBarHidden property is disabled.
     */
    var isChild: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disposeBag ~ [
            viewModel.alert ~> rx.alert,
            viewModel.actionSheet ~> rx.actionSheet
        ]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let navigationController = navigationController, !isChild else {
            return
        }
        if navigationController.isNavigationBarHidden != isNavigationBarHidden {
            navigationController.isNavigationBarHidden = isNavigationBarHidden
        }
        
    }
    
    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension BaseViewController: RxAlertViewable {}
