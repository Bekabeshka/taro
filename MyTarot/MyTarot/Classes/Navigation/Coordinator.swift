//
//  Coordinator.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import Foundation

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func add(_ coordinator: Coordinator) {
        if !children.contains(where: { $0 === coordinator }) {
            children.append(coordinator)
        }
    }
    
    func remove(_ coordinator: Coordinator) {
        if let index = children.firstIndex(where: { $0 === coordinator }) {
            children.remove(at: index)
        }
    }
}
