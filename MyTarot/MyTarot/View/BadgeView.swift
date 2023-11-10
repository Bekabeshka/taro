//
//  BadgeView.swift
//  MyTarot
//
//  Created by Ilushk on 07.11.2023.
//

import SwiftUI

struct BadgeViewData {
    let text: String
    
    init(text: String) { self.text = text }
}

struct BadgeView: View {
    let viewData: BadgeViewData
    var body: some View {
        Text(viewData.text)
            .font(Font.custom("Sora", size: 10).weight(.semibold))
            .lineSpacing(11)
            .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))

    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        
        RectangleBadgeView(viewData: BadgeViewData(text: "$5"))
            .foregroundColor(.primaryGreen)
            .background(Color.secondaryGreen)
            .cornerRadius(.rectangleBadgeCR)
        
        BadgeView(viewData: BadgeViewData(text: "New"))
            .foregroundColor(.primaryWhite)
            .background(
                LinearGradient(
                    colors: [.gradientOrange, .gradientRed, .gradientPink],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            )
            .cornerRadius(.badgeCR)
    }
}
