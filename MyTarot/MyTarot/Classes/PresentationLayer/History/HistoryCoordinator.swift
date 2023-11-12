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
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let historyViewController = HistoryView().viewController
        router.setRootModule(historyViewController)
    }
}
