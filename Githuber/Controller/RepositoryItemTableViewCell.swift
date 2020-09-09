//
//  RepositoryItemTableViewCell.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxDataSourcesSingleSection

final class RepositoryItemTableViewCell: UITableViewCell {
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkText
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(fullNameLabel)
        addSubview(colorView)
        addSubview(languageLabel)
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createConstraints() {
        fullNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(17)
            $0.right.equalToSuperview().inset(17)
        }
        
        colorView.snp.makeConstraints {
            $0.size.equalTo(8)
            $0.left.equalTo(fullNameLabel)
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        languageLabel.snp.makeConstraints {
            $0.left.equalTo(colorView.snp.right).offset(5)
            $0.centerY.equalTo(colorView)
            $0.right.equalTo(fullNameLabel)
        }
    }
    
}

extension RepositoryItemTableViewCell: Configurable {
    
    typealias Model = RepositoryItem
    
    func configure(_ model: Model) {
        fullNameLabel.text = model.fullName
        colorView.backgroundColor = model.languageColor
        languageLabel.text = model.language
    }
}
