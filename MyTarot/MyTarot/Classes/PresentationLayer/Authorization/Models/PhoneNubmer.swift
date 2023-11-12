//
//  PhoneNubmer.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import Foundation

struct PhoneNubmer: Identifiable {
    let id: String
    let name: String
    let flag: String
    let dialCode: String
    let pattern: String
    
    static let allCountry: [PhoneNubmer] = [
        PhoneNubmer(
            id: "0",
            name: "United Kingdom",
            flag: "🇬🇧",
            dialCode: "+44",
            pattern: "## #### ##"
        ),
        PhoneNubmer(
            id: "1",
            name: "Kazakhstan",
            flag: "🇰🇿",
            dialCode: "+7",
            pattern: "(###) ###-##-##"
        ),
        PhoneNubmer(
            id: "2",
            name: "United States",
            flag: "🇺🇸",
            dialCode: "+1",
            pattern: "### ### ####"
        )
    ]
    static let example = allCountry[1]
}
