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
    }
}
