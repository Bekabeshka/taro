//
//  PrimaryButton.swift
//  MyTarot
//
//  Created by bekabeshka on 06.11.2023.
//

import SwiftUI

struct PrimaryButtonViewData {
    let text: String
    let iconName: String?
    
    init(text: String, iconName: String? = nil) {
        self.text = text
        self.iconName = iconName
    }
}

struct PrimaryButton: View {
    let viewData: PrimaryButtonViewData
    
    var body: some View {
        Button {
            print("Sign In with Apple")
        } label: {
            HStack(spacing: 12) {
                if let iconName = viewData.iconName {
                    Image(iconName)
                }
                Text(viewData.text)
                    .padding(Constants.buttonPadding)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private enum Constants {
        static let buttonPadding = EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0)
    }
}
