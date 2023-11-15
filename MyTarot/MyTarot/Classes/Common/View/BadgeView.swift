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
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        
//        RectangleBadgeView(viewData: BadgeViewData(text: "$5"))
//            .foregroundColor(.green)
//            .background(Color.Background.green)
//            .cornerRadius(.rectangleBadgeCR)
        
        BadgeView(viewData: BadgeViewData(text: "New"))
            .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
            .foregroundColor(Color.Text.white)
            .background(
                LinearGradient(
                    colors: [Color.Background.gradientOrange, Color.Background.gradientRed, Color.Background.gradientPink],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            )
            .cornerRadius(.badgeCR)
    }
}
