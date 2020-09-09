//
//  RepositoryItem.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

class RepositoryItem: Codable {
    let fullName: String?
    let language: String?
    
    private enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case language
    }
}
