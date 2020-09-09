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
        
        return label
    }()
    
    private lazy var colorView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        
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
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(17)
        }
        
        colorView.snp.makeConstraints {
            $0.size.equalTo(6)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(fullNameLabel.snp.right).offset(5)
        }
        
        languageLabel.snp.makeConstraints {
            $0.left.equalTo(colorView.snp.right).offset(5)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
}

extension RepositoryItemTableViewCell: Configurable {
    
    typealias Model = RepositoryItem
    
    func configure(_ model: Model) {
        fullNameLabel.text = model.fullName
        languageLabel.text = model.language
    }
}
