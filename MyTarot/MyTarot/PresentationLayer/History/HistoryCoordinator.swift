//
//  HistoryCoordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit
import SwiftUI

final class HistoryCoordinator: Coordinator {
    var children: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let historyViewController = HistoryView().viewController
        navigationController.viewControllers = [historyViewController]
    }
}
