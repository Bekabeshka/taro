//
//  Color+Theme.swift
//  MyTarot
//
//  Created by bekabeshka on 06.11.2023.
//

import SwiftUI

extension Color {
    static var primaryBlack: Color {
        Color(hex: "020202")
    }
    
    static var primaryWhite: Color {
        Color(hex: "FFFFFF")
    }
    
    static var primaryGray: Color {
        Color(hex: "000000").opacity(0.25)
    }
    
    static var primaryGreen: Color {
        Color(hex: "51F051")
    }
    
    static var primaryDisabledText: Color {
        Color(hex: "F0E051")
    }
    
    static var secondaryGreen: Color {
        Color(red: 0.34, green: 0.58, blue: 0.34).opacity(0.35)
    }
    
    static var primaryDisabled: Color {
        Color(red: 0.58, green: 0.55, blue: 0.34).opacity(0.35)
    }
    
    static var textGray: Color {
        Color(hex: "707070")
    }
    
    static var gradientRed: Color {
        Color(hex: "FE1919")
    }
    
    static var gradientOrange: Color {
        Color(hex: "FE5824")
    }
    
    static var gradientPink: Color {
        Color(hex: "FE1979")
    }
}
