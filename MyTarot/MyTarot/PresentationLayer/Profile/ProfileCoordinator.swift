//
//  ProfileCoordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    var children: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileView().viewController
        navigationController.viewControllers = [profileViewController]
    }
}
