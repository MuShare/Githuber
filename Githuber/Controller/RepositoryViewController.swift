//
//  RepositoryViewController.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxSwift

final class RepositoryViewController: BaseViewController<RepositoryViewModel> {
    
    private lazy var ownerAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var ownerLoginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override func subviews() -> [UIView] {
        return [
            ownerAvatarImageView,
            ownerLoginLabel,
            nameLabel,
            descriptionLabel
        ]
    }
    
    override func bind() -> [Disposable] {
        return [
            viewModel.ownerAvatar ~> ownerAvatarImageView.kf.rx.image,
            viewModel.ownerLogin ~> ownerLoginLabel.rx.text,
            viewModel.fullName ~> nameLabel.rx.text,
            viewModel.descriptionString ~> descriptionLabel.rx.text
        ]
    }
    
    override func createConstraints() {
        ownerAvatarImageView.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.left.equalToSuperview().offset(15)
            $0.top.equalTo(view.safeArea.top).offset(15)
        }
        
        ownerLoginLabel.snp.makeConstraints {
            $0.centerY.equalTo(ownerAvatarImageView)
            $0.left.equalTo(ownerAvatarImageView.snp.right).offset(10)
            $0.right.equalToSuperview().inset(15)
        }
        
        nameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.top.equalTo(ownerAvatarImageView.snp.bottom).offset(15)
            $0.right.equalToSuperview().inset(15)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.right.equalToSuperview().inset(15)
        }
    }
}
