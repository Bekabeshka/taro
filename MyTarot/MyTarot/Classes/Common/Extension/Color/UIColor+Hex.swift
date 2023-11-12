//
//  UIColor+Hex.swift
//  MyTarot
//
//  Created by bekabeshka on 10.11.2023.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            self.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    convenience init?(hex: String?) {
        guard let hex else { return nil }
        self.init(hex: hex)
    }
}
