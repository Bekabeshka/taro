//
//  ProfileCoordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    var children: [Coordinator] = []
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let profileViewController = ProfileView().viewController
        router.setRootModule(profileViewController)
    }
}
