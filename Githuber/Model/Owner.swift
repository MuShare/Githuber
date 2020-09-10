//
//  Owner.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

class Owner: Codable {
    let login: String?
    let avatarUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
    
    public init(login: String?, avatarUrl: String?) {
        self.login = login
        self.avatarUrl = avatarUrl
    }
}

extension Owner: Equatable {
    static func == (lhs: Owner, rhs: Owner) -> Bool {
        return lhs.login == rhs.login && lhs.avatarUrl == rhs.avatarUrl
    }
}
