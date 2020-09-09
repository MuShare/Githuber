//
//  SelectionTableViewCell.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxDataSourcesSingleSection

private enum Const {
    static let margin = 16
    
    enum Icon {
        static let size = 26
    }
    
    enum Title {
        static let marginRight = 17
    }
}

struct Selection {
    
    let identifier = UUID().uuidString
    var icon: UIImage?
    var title: String?
    var subtitle: String?
    var accessory: UITableViewCell.AccessoryType = .none
    
    var iconURL: URL?
    
    init(icon: UIImage? = nil, title: String?, subtitle: String? = nil, accessory: UITableViewCell.AccessoryType) {
        self.init(icon: icon, title: title, subtitle: subtitle)
        self.accessory = accessory
    }
    
    init(icon: UIImage? = nil, title: String?, subtitle: String? = nil) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
    
    init(icon: UIImage? = nil, title: String?) {
        self.icon = icon
        self.title = title
    }
    
    init(iconURL: URL? = nil, title: String?) {
        self.iconURL = iconURL
        self.title = title
    }
    
    init(title: String) {
        self.title = title
    }
    
}

extension Selection: Equatable {
    public static func == (lhs: Selection, rhs: Selection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

class SelectionTableViewCell: UITableViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createConstraints() {
        iconImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Const.margin)
            $0.size.equalTo(Const.Icon.size)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(iconImageView.snp.right).offset(Const.margin)
            $0.centerY.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.right).offset(Const.margin)
            $0.right.equalToSuperview().offset(-Const.Title.marginRight)
            $0.centerY.equalToSuperview()
        }
    }
    
}

extension SelectionTableViewCell: Configurable {
    
    typealias Model = Selection
    
    func configure(_ selection: Selection) {
        if selection.iconURL == nil && selection.icon == nil {
            iconImageView.snp.updateConstraints {
                $0.left.equalToSuperview().offset(0)
                $0.width.equalTo(0)
            }
        } else {
            iconImageView.snp.updateConstraints {
                $0.left.equalToSuperview().offset(Const.margin)
                $0.width.equalTo(Const.Icon.size)
            }
        }
        
        if let iconURL = selection.iconURL {
            iconImageView.kf.setImage(with: iconURL)
        } else {
            iconImageView.image = selection.icon
        }
        
        titleLabel.text = selection.title
        subtitleLabel.text = selection.subtitle
        accessoryType = selection.accessory
    }
    
}
