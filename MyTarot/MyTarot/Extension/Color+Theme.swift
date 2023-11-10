//
//  Color+Theme.swift
//  MyTarot
//
//  Created by bekabeshka on 06.11.2023.
//

import SwiftUI

extension Color {
    enum Background {
        static var black: Color {
            Color(hex: "020202")
        }
        
        static var white: Color {
            Color(hex: "FFFFFF")
        }
        
        static var gray: Color {
            Color(hex: "1E1E1E")
        }
        
        static var green: Color {
            Color(hex: "579557").opacity(0.35)
        }
        
        static var yellow: Color {
            Color(hex: "958B57").opacity(0.35)
        }
        
        enum Text {
            static var white: Color {
                Color(hex: "FFFFFF")
            }
            
            static var error: Color {
                Color(hex: "983E31")
            }
            
            static var lightGray: Color {
                Color(hex: "E6E6E6")
            }
            
            static var gray: Color {
                Color(hex: "666766")
            }
            
            static var yellow: Color {
                Color(hex: "F0E051")
            }
            
            static var green: Color {
                Color(hex: "51F051")
            }
            
        }
    }
    
    static var primaryBlack: Color {
        Color(hex: "020202")
    }
    
    static var primaryWhite: Color {
        Color(hex: "FFFFFF")
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
