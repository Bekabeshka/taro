//
//  HomeCoordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit
import SwiftUI

final class HomeCoordinator: Coordinator {
    var children: [Coordinator] = []
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let homeViewController = TaroPredictionPage().viewController
        router.setRootModule(homeViewController)
    }
}
