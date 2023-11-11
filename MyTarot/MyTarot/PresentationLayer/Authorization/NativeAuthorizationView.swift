//
//  NativeAuthorizationView.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import SwiftUI

struct NativeAuthorizationView: View {
    var body: some View {
        ZStack() {
            Color.Background.black.ignoresSafeArea()
            VStack() {
                CountryPhoneCodeButton { }

                Spacer()
                PrimaryButton(viewData: PrimaryButtonViewData(text: "Send Code"))
                    .foregroundColor(.Background.white)
                    .background(Color.Background.gray)
                    .cornerRadius(.cornerRadius)
                
            }.padding(.screenInsets)
        }
    }
}

struct NativeAuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        NativeAuthorizationView()
    }
}

struct CountryPhoneCodeButton: View {
    private let action: (() -> Void)
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                Text("🇸🇴")
                    .frame(width: 20, height: 20)
                Image("arrow-down")
                    .frame(width: 18, height: 18)
            }
        }
    }
}
