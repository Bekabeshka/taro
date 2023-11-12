//
//  PhoneNumberView.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import SwiftUI
import Combine

struct PhoneNumberView: View {
    @State private var phoneNumber = ""
    @FocusState private var keyIsFocused: Bool
    
    @Binding var country: PhoneNubmer
    let buttonAction: (() -> Void)
    let didEnterPhoneNumber: ((String) -> Void)
    
    var body: some View {
        HStack {
            Button {
                buttonAction()
                keyIsFocused = false
            } label: {
                Text("\(country.flag) \(country.dialCode)")
                    .padding(10)
                    .frame(minWidth: 80, minHeight: 47)
                    .background(Color.Background.gray, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .foregroundColor(.Text.white)
            }
            
            TextField("", text: $phoneNumber)
                .placeholder(when: phoneNumber.isEmpty) {
                    Text("Phone number")
                        .foregroundColor(.Text.gray)
                }
                .focused($keyIsFocused)
                .keyboardType(.numbersAndPunctuation)
                .onReceive(Just(phoneNumber)) { _ in
                    applyPatternOnNumbers(&phoneNumber, replacementCharacter: "#")
                }
                .onReceive(Just(phoneNumber)) { _ in
                    didEnterPhoneNumber(phoneNumber)
                }
                .foregroundColor(.Text.white)
                .padding(10)
        }
    }
    
    private func applyPatternOnNumbers(_ stringvar: inout String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< country.pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: country.pattern)
            let patternCharacter = country.pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        
        if stringvar.count < country.pattern.count {
            stringvar = String(pureNumber.prefix(country.pattern.count))
        } else {
            stringvar = pureNumber
        }
    }
}
