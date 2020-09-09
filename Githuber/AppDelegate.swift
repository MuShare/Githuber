//
//  AppDelegate.swift
//  Githuber
//
//  Created by Meng Li on 2020/09/09.
//  Copyright © 2020 MuShare. All rights reserved.
//

import RxSwift
import RxCocoa
import RxFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let coordinator = FlowCoordinator()
    private let disposeBag = DisposeBag()
    private let window = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        #if DEBUG
        // Listen for Coordinator mechanism is not mandatory
        coordinator.rx.didNavigate.subscribe(onNext: {
            AppLog.debug("did navigate to \($0) -> \($1)")
        }).disposed(by: disposeBag)
        #endif
        
        // Luach the app with an appFlow.
        coordinator.coordinate(
            flow: AppFlow(window: window),
            with: OneStepper(withSingleStep: AppStep.search)
        )
        window.makeKeyAndVisible()
        
        return true
    }

}

