//
//  AuthorizationView.swift
//  MyTarot
//
//  Created by bekabeshka on 06.11.2023.
//

import SwiftUI

struct AuthorizationView: View {
    var body: some View {
        ZStack() {
            Color.primaryBlack.ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                PrimaryButton(viewData: PrimaryButtonViewData(text: "Sign In with Apple", iconName: "apple-logo"))
                    .background(Color.primaryWhite)
                    .foregroundColor(.primaryBlack)
                    .cornerRadius(.cornerRadius)
                    
                PrimaryButton(viewData: PrimaryButtonViewData(text: "Sign In with Apple"))
                    .background(Color.primaryGray)
                    .foregroundColor(.primaryWhite)
                    .cornerRadius(.cornerRadius)
            }
            .padding(Constants.insets)
        }
    }
    
    private enum Constants {
        static let insets = EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
