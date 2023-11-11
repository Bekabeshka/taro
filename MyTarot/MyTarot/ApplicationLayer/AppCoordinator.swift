//
//  AppCoordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {
    var children: [Coordinator] = []
    let tabBarController: UITabBarController
    private var preparedViewControllers: [UIViewController] = []
    
    init() {
        tabBarController = AppTabBarController()
    }
    
    func start() {
        _ = configureHomeCoordinator()
        _ = configureHistoryCoordinator()
        _ = configureProfileCoordinator()

        tabBarController.viewControllers = preparedViewControllers
    }
    
    private func configureHomeCoordinator() -> HomeCoordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home-tab"), tag: 0)
        let coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator.start()
        
        add(coordinator)
        preparedViewControllers.append(navigationController)
        
        return coordinator
    }
    
    private func configureHistoryCoordinator() -> HistoryCoordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "history-tab"), tag: 1)
        let coordinator = HistoryCoordinator(navigationController: navigationController)
        coordinator.start()
        
        add(coordinator)
        preparedViewControllers.append(navigationController)
        
        return coordinator
    }
    
    private func configureProfileCoordinator() -> ProfileCoordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile-tab"), tag: 2)
        let coordinator = ProfileCoordinator(navigationController: navigationController)
        coordinator.start()
        
        add(coordinator)
        preparedViewControllers.append(navigationController)
        
        return coordinator
    }
}
