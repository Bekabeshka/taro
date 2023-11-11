//
//  SceneDelegate.swift
//  MyTarot
//
//  Created by bekabeshka on 10.11.2023.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UISceneDelegate {
    private var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .dark

        appCoordinator = AppCoordinator()
        appCoordinator.start()

        window?.rootViewController = appCoordinator.tabBarController
        window?.makeKeyAndVisible()
    }
}

struct TabBarButton {
    let iconName: String
    let viewController: UIViewController
}

struct HomeView: View {
    var action: (() -> Void)?
    var body: some View {
        Button(action: action ?? { }, label: {
            Text("Home button")
        })
    }
}

struct HistoryView: View {
    var body: some View {
        Text("History screen")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile screen")
    }
}
