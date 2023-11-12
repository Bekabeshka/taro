//
//  AuthCoordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import Foundation

final class AuthCoordinator: Coordinator {
    var children: [Coordinator] = []
    let router: Router
    private let pagesFactory: AuthPagesFactory
    
    init(router: Router, pagesFactory: AuthPagesFactory) {
        self.router = router
        self.pagesFactory = pagesFactory
    }
    
    func start() {
        var view = pagesFactory.makeAuthorizationPage()
        view.authorize = { [weak self] in
            self?.startNativeAuthorization()
        }
        router.setRootModule(view.viewController)
    }
    
    private func startNativeAuthorization() {
        var view = pagesFactory.makeNativeAuthorizationPage()
        view.didTapSendCode = { [weak self] _ in
            self?.startOtpCodeVerificationPage()
        }
        router.push(view.viewController)
    }
    
    private func startOtpCodeVerificationPage() {
        let view = pagesFactory.makeOtpCodeVerificationPage()
        
        router.push(view.viewController)
    }
}

final class AuthPagesFactory {
    func makeAuthorizationPage() -> AuthorizationPage {
        return AuthorizationPage()
    }
    
    func makeNativeAuthorizationPage() -> NativeAuthorizationPage {
        return NativeAuthorizationPage(counrties: PhoneNubmer.allCountry, defaultCountry: .example)
    }
    
    func makeOtpCodeVerificationPage() -> OtpCodeVerificationPage {
        let viewModel = OtpCodeVerificationViewModel()
        return OtpCodeVerificationPage(viewModel: viewModel)
    }
}
