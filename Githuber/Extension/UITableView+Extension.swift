//
//  UITableView+Extension.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

extension UITableView {
    
    func hideFooterView() {
        tableFooterView = UIView(frame: .zero)
        tableFooterView?.backgroundColor = .clear
    }
    
}
