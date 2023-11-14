//
//  View+ViewController.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import SwiftUI

extension View {
    var viewController: UIViewController {
        return UIHostingController(rootView: self)
    }
}
