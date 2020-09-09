//
//  Array+Extension.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

extension Array {
    
    func isSafe(for index: Int) -> Bool {
        return 0 ..< count ~= index
    }
    
}
