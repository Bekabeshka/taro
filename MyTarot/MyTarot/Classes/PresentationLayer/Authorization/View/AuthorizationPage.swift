//
//  AuthorizationPage.swift
//  MyTarot
//
//  Created by bekabeshka on 06.11.2023.
//

import SwiftUI
import AuthenticationServices

struct AuthorizationPage: View {
    var authorize: VoidCallback?
    
    var body: some View {
        ZStack() {
            Color.Background.black.ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                PrimaryButton(viewData: PrimaryButtonViewData(
                    text: "Sign In with Apple",
                    iconName: "apple-logo",
                    action: {
                        appleAuthorize()
                    }
                ))
                .background(Color.Background.white)
                .foregroundColor(.Background.black)
                .cornerRadius(.cornerRadius)
                    
                PrimaryButton(viewData: PrimaryButtonViewData(
                    text: "Sign In with Apple",
                    action: authorize
                ))
                .background(Color.Background.gray)
                .foregroundColor(.Background.white)
                .cornerRadius(.cornerRadius)
            }
            .padding(.screenInsets)
        }
    }
    
    private func appleAuthorize() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.performRequests()
    }
}

struct AuthorizationPage_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationPage()
    }
}
