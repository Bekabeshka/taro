//
//  NavigationRouter.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit

final class NavigationRouter: Router {
    private let navigationController: UINavigationController
    private var completions: [UIViewController : VoidCallback]
    
    var toPresent: UIViewController {
        return navigationController
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
    }
    
    func present(_ module: Presentable) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable, animated: Bool) {
        navigationController.present(module.toPresent, animated: animated)
    }
    
    func push(_ module: Presentable) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable, animated: Bool, completion: VoidCallback?) {
        guard
            !(module is UINavigationController)
        else { return assertionFailure("⚠️Deprecated push UINavigationController.") }
        if let completion = completion {
            completions[module.toPresent] = completion
        }
        navigationController.pushViewController(module.toPresent, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: VoidCallback?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable, hideBar: Bool) {
        navigationController.setViewControllers([module.toPresent], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
}

private extension NavigationRouter {
    func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
