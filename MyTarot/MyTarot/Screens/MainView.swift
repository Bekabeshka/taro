//
//  MainView.swift
//  MyTarot
//
//  Created by Ilushk on 07.11.2023.
//

import SwiftUI

struct MainView: View {
    let userGreetingViewData = UserGreetingViewData(image: "user-pic", text: "Hey, Amanda")
    let dailyCardViewData = DailyCardViewData(header: "Card of the day", subHead: "You have new card!", badgeText: "New")
    let cardCellViewData = CardCellViewData(
        imageUrl: nil,
        header: "How will my career develop",
        description: "2 cards reeding",
        badge: BadgeViewData(text: "Free"),
        isDisabled: false
    )
    
    var body: some View {
        ZStack() {
            Color.black.ignoresSafeArea()
            Rectangle()
                .overlay {
                    Image("backgroundPattern")
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                        .opacity(0.1)
                }
                .foregroundColor(.clear)
            

            ScrollView {
                VStack(spacing: 12) {
                    VStack(spacing: 24) {
                        UserGreetingView(viewData: userGreetingViewData)
                        ZStack {
                            Image("accentCard")
                                .offset(x: 130, y: -39)
                            DailyCardView(viewData: dailyCardViewData)
                        }
                        LazyVGrid(columns: [GridItem()]) {
                            ForEach(1...20, id: \.self) {_ in
                                CardCellView(viewData: cardCellViewData)
                            }
                        }
                    }
                }
                .padding()//setup padding
            }
        }

//        .safeAreaInset(edge: .bottom) {
//            Text("aaaaaaa")
//                .foregroundColor(.red)
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
