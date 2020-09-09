//
//  Kingfisher+Rx.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import Kingfisher
import RxCocoa
import RxSwift

extension Reactive where Base == KingfisherWrapper<UIImageView> {
    
    var image: Binder<URL?> {
        return Binder(base.base) { imageView, image in
            imageView.kf.cancelDownloadTask()
            imageView.kf.setImage(with: image)
        }
    }
    
}

extension Reactive where Base == KingfisherWrapper<UIButton> {
    
    func image(for state: UIControl.State) -> Binder<URL?> {
        return Binder(base.base) { button, image in
            button.kf.cancelImageDownloadTask()
            button.kf.setImage(with: image, for: state)
        }
    }
}

extension KingfisherWrapper: ReactiveCompatible {}
