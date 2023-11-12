//
//  Router.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import Foundation

typealias VoidCallback = (() -> Void)

protocol Router: Presentable {
    func present(_ module: Presentable)
    func present(_ module: Presentable, animated: Bool)
    
    func push(_ module: Presentable)
    func push(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool, completion: VoidCallback?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: VoidCallback?)
    
    func setRootModule(_ module: Presentable)
    func setRootModule(_ module: Presentable, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}
