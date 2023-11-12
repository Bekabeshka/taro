//
//  Presentable.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit

protocol Presentable {
    var toPresent: UIViewController { get }
}

extension UIViewController: Presentable {
    var toPresent: UIViewController {
        return self
    }
}
