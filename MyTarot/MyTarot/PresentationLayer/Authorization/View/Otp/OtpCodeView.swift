//
//  OtpCodeView.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import SwiftUI

struct OtpCodeView: View {
    @State private var otpCode = ""
    @FocusState private var isKeyboardShowing
    private let onEnterCode: ((String) -> Void)
    
    init(onEnterCode: @escaping (String) -> Void) {
        self.onEnterCode = onEnterCode
    }
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<Constants.otpCodeLength, id: \.self) { index in
                otpBox(index)
            }
        }
        .background {
            hiddenTextField()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .foregroundColor(.Text.white)
    }
    
    @ViewBuilder
    private func otpBox(_ index: Int) -> some View {
        if otpCode.count > index {
            let startIndex = otpCode.startIndex
            let charIndex = otpCode.index(startIndex, offsetBy: index)
            OtpCodeBox(text: String(otpCode[charIndex]), isFirstResponder: otpCode.count == index)
        } else {
            OtpCodeBox(text: "", isFirstResponder: otpCode.count == index)
        }
    }
    
    @ViewBuilder
    private func hiddenTextField() -> some View {
        TextField("", text: $otpCode)
            .onChange(of: otpCode) { newValue in
                if newValue.count == Constants.otpCodeLength {
                    onEnterCode(newValue)
                    isKeyboardShowing = false
                } else if newValue.count > Constants.otpCodeLength {
                    otpCode = String(newValue.prefix(Constants.otpCodeLength))
                }
            }
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .frame(width: 0, height: 0)
            .focused($isKeyboardShowing)
    }
    
    private enum Constants {
        static let otpCodeLength = 4
    }
}
