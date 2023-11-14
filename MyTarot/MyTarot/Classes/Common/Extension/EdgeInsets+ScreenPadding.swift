//
//  EdgeInsets+ScreenPadding.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import SwiftUI

extension EdgeInsets {
    static let screenInsets = EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
    
    static func bottom(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: 0, leading: 0, bottom: value, trailing: 0)
    }
    
    static func top(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: 0, bottom: 0, trailing: 0)
    }
    
    static func leading(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: 0, leading: value, bottom: 0, trailing: 0)
    }
    
    static func trailing(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: value)
    }
}
