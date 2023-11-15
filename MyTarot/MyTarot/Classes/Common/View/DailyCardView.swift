//
//  DailyCardView.swift
//  MyTarot
//
//  Created by Ilushk on 07.11.2023.
//

import SwiftUI

struct DailyCardViewData {
    let header: String
    let subHead: String
    let badgeText: String
}

struct DailyCardView: View {
    let viewData: DailyCardViewData
    var body: some View {
        //TODO: write button press logic later
        Button(action: { print("1") }) {
            HStack(spacing: 20) {
                BadgeView(viewData: BadgeViewData(text: viewData.badgeText))
                    .padding(Constants.badggePadding)
                    .foregroundColor(Color.Text.white)
                    .background(
                        LinearGradient(
                            colors: [Color.Background.gradientOrange, Color.Background.gradientRed, Color.Background.gradientPink],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
                    .cornerRadius(.badgeCR)
                TextView(header: viewData.header, subHead: viewData.subHead)
                Spacer()
                Image("Vector")
                    .foregroundColor(Color.Background.white)
            }
        }
        .padding(Constants.padding)
        .frame(maxWidth: .infinity)
        .background((Color.Background.gray).opacity(0.02))
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}

//TODO: import correct font
private struct TextView: View {
    let header: String
    let subHead: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(Font.custom("Sora", size: 18).weight(.semibold))
                .foregroundColor(.white)
            Text(subHead)
                .font(Font.custom("Sora", size: 12))
                .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
        }
        
    }
}

private enum Constants {
    static let padding = EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
    static let badggePadding = EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8)
}

struct ContentVi_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Rectangle()
                .background(Color.Background.white)
                .frame(width: 24, height: 24)
            DailyCardView(viewData: DailyCardViewData(header: "Card of the day", subHead: "You have new card!", badgeText: "New"))
        }
    }
}

