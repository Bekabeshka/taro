//
//  AppTabBarController.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit

final class AppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        delegate = self
    }
    
    private func layoutUI() {
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor(hex: "FBFCFB").withAlphaComponent(0.2)
        itemAppearance.selected.iconColor = UIColor(hex: "FBFCFB")
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance = itemAppearance
        tabBar.standardAppearance = tabBarAppearance
    }
}

extension AppTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let originTag: Int = fromVC.tabBarItem.tag
        let destinationTag: Int = toVC.tabBarItem.tag
        
        let direction: TabBarAnimatedTransition.Direction = (originTag < destinationTag) ? .toLeft : .toRight
        return TabBarAnimatedTransition(direction: direction)
    }
}
