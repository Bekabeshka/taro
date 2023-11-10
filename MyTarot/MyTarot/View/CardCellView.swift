//
//  CardCellView.swift
//  MyTarot
//
//  Created by Ilushk on 07.11.2023.
//

import SwiftUI

struct CardCellViewData {
    let imageUrl: URL?
    let header: String
    let description: String
    let badge: BadgeViewData
    let isDisabled: Bool
}

struct CardCellView: View {
    let viewData: CardCellViewData
    var body: some View {
        //TODO: write button press logic later
        Button(action: { print("1") }) {
            VStack {
                HStack {
                    Text(viewData.header)
                        .font(Font.custom("Sora", size: 28).weight(.bold))
                        .lineLimit(3...)
                        .foregroundColor(.primaryWhite)
                        .padding(EdgeInsets(top: 21, leading: 0, bottom: 21, trailing: 0))
                    Spacer()
                    ZStack {
                        AsyncImage(url: viewData.imageUrl)
                            .opacity(0.70)
                            .blur(radius: 15)
                        
                        AsyncImage(url: viewData.imageUrl)
                            .scaledToFill()
                    }
                }
                .padding(EdgeInsets(top: 21, leading: 24, bottom: 0, trailing: 0))
                .frame(width: 361, height: 106)
                
                Divider()
                    .opacity(0.3)
                HStack {
                    Text(viewData.description)
                        .font(Font.custom("Sora", size: 14))
                        .lineSpacing(18)
                        .foregroundColor(.textGray)
                    Spacer()
                    RectangleBadgeView(viewData: viewData.badge)
                        .foregroundColor(viewData.isDisabled ? .Background.yellow : .Background.green)
                        .background(viewData.isDisabled ? Color.Background.yellow : Color.Background.green)
                        .cornerRadius(.rectangleBadgeCR)
                    
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 8, trailing: 8))
            }
        }
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .cornerRadius(8)
    }
}



struct CardCellView_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CardCellView(
                viewData: CardCellViewData(
                    imageUrl: URL(string: "https://picsum.photos/200"),
                    header: "How will my career develop",
                    description: "2 cards reeding",
                    badge: BadgeViewData(text: "Free"),
                    isDisabled: true
                )
            )
        }
    }
}
