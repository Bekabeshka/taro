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
                        .opacity(0.05)
                }
                .foregroundColor(.clear)
            

            ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        UserGreetingView(viewData: userGreetingViewData)
                            .padding(.top, 20)
                            .padding(Constants.insets)

                        ZStack {
                            Image("accentCard")
                                .offset(x: 130, y: -39)
                            DailyCardView(viewData: dailyCardViewData)
                        }
                        .padding(Constants.insets)
                        SegmentedPickerExample(titles: [
                            SegmentItem(title: "All", badge: "23"),
                            SegmentItem(title: "Free", badge: "15"),
                            SegmentItem(title: "Paid", badge: "5"),
                            SegmentItem(title: "Active", badge: "11"),
                            SegmentItem(title: "Free", badge: "3"),
                            SegmentItem(title: "All", badge: "7")
                        ])
                        .padding(.top, 24)
                        LazyVGrid(columns: [GridItem()]) {
                            ForEach(1...20, id: \.self) {_ in
                                CardCellView(viewData: cardCellViewData)
                            }
                        }
                        .padding(Constants.insets)
                    }
                    .padding(.top, 32)
            }
            
        }
    }
}

private enum Constants {
    static let insets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

