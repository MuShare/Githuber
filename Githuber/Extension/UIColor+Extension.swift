//
//  UIColor+Extension.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

extension UIColor {
    
    @objc convenience init(hex: UInt32) {
        let mask = 0x0000ff
        
        let r = CGFloat(Int(hex >> 16) & mask) / 255
        let g = CGFloat(Int(hex >> 8) & mask) / 255
        let b = CGFloat(Int(hex) & mask) / 255
        
        self.init(red:r, green:g, blue:b, alpha:1)
    }
    
    @objc convenience init(hex: UInt32, alpha: CGFloat) {
        let mask = 0x0000ff
        
        let r = CGFloat(Int(hex >> 16) & mask) / 255
        let g = CGFloat(Int(hex >> 8) & mask) / 255
        let b = CGFloat(Int(hex) & mask) / 255
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
}
