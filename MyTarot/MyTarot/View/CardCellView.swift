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
                        .foregroundColor(Color.Text.white)
                        .padding(EdgeInsets(top: 21, leading: 24, bottom: 0, trailing: 0))

                    Spacer()
                    ZStack {
                        AsyncImage(url: viewData.imageUrl)
                            .opacity(0.70)
                            .blur(radius: 15)
                        
                        AsyncImage(url: viewData.imageUrl)
                            .scaledToFill()
                    }
                    .frame(width: 56, height: 106)
                }
                                
                .frame(width: 361, height: 106)
                
                Divider()
                    .opacity(0.3)
                HStack {
                    Text(viewData.description)
                        .font(Font.custom("Sora", size: 14))
                        .lineSpacing(18)
                        .foregroundColor(Color.Text.neutralGray)
                    Spacer()
                    RectangleBadgeView(viewData: viewData.badge)
                        .foregroundColor(viewData.isDisabled ? .Text.yellow : .Text.green)
                        .background(viewData.isDisabled ? Color.Background.yellow : Color.Background.green)
                        .cornerRadius(.rectangleBadgeCR)
                    
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 8, trailing: 8))
            }
        }
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}



struct CardCellView_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CardCellView(
                viewData: CardCellViewData(
                    imageUrl: nil,
                    header: "How will my career develop",
                    description: "2 cards reeding",
                    badge: BadgeViewData(text: "Free"),
                    isDisabled: true
                )
            )
            .padding()
        }
    }
}
