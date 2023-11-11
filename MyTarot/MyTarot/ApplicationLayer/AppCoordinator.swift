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
    private let coordinatorsFactory: CoordinatorsFactory
    private var preparedViewControllers: [UIViewController] = []
    
    init(coordinatorsFactory: CoordinatorsFactory) {
        self.tabBarController = AppTabBarController()
        self.coordinatorsFactory = coordinatorsFactory
    }
    
    func start() {
        _ = configureHomeCoordinator()
        _ = configureHistoryCoordinator()
        _ = configureProfileCoordinator()

        tabBarController.viewControllers = preparedViewControllers
    }
    
    private func configureHomeCoordinator() -> Coordinator {
        let coordinator = coordinatorsFactory.makeHomeCoordinator()
        coordinator.start()
        
        add(coordinator)
        preparedViewControllers.append(coordinator.router.toPresent)
        
        return coordinator
    }
    
    private func configureHistoryCoordinator() -> HistoryCoordinator {
        let coordinator = coordinatorsFactory.makeHistoryCoordinator()
        coordinator.start()
        
        add(coordinator)
        preparedViewControllers.append(coordinator.router.toPresent)
        
        return coordinator
    }
    
    private func configureProfileCoordinator() -> ProfileCoordinator {
        let coordinator = coordinatorsFactory.makeProfileCoordinator()
        coordinator.start()
        
        add(coordinator)
        preparedViewControllers.append(coordinator.router.toPresent)
        
        return coordinator
    }
}

final class CoordinatorsFactory {
    func makeHomeCoordinator() -> HomeCoordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home-tab"), tag: 0)
        return HomeCoordinator(router: NavigationRouter(navigationController: navigationController))
    }
    
    func makeHistoryCoordinator() -> HistoryCoordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "history-tab"), tag: 1)
        return HistoryCoordinator(router: NavigationRouter(navigationController: navigationController))
    }
    
    func makeProfileCoordinator() -> ProfileCoordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile-tab"), tag: 2)
        return ProfileCoordinator(router: NavigationRouter(navigationController: navigationController))
    }
}
