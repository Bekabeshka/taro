//
//  OtpCodeBox.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import SwiftUI

struct OtpCodeBox: View {
    private let text: String
    private let isFirstResponder: Bool
    
    init(text: String, isFirstResponder: Bool) {
        self.text = text
        self.isFirstResponder = isFirstResponder
    }
    
    var body: some View {
        Text(text)
            .frame(width: 68, height: 68)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFirstResponder ? Color.Background.white: Color.Background.white.opacity(0.1))
                    .animation(.easeOut, value: 0.3)
            }
    }
}
