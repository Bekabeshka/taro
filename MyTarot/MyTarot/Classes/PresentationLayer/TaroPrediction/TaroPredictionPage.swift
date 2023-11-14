//
//  TaroPredictionPage.swift
//  MyTarot
//
//  Created by bekabeshka on 12.11.2023.
//

import SwiftUI

struct TaroPredictionPage: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem()]) {
                TaroCardView(image: UIImage(named: "the-twins"), title: "Спрашивающий\n The Twins", description: "As a rule, the Chariot card is usually awarded to people who are really eager to find themselves, reaching for something new, and they are literally overflowing with energy and enthusiasm. They are active and optimistic, and always strive to achieve their goals, not just professionally, but also in their relationships.")
                TaroCardView(image: UIImage(named: "the-twins"), title: "Спрашивающий\n The Twins", description: "As a rule, the Chariot card is usually awarded to people who are really eager to find themselves, reaching for something new, and they are literally overflowing with energy and enthusiasm. They are active and optimistic, and always strive to achieve their goals, not just professionally, but also in their relationships.")
                TaroCardView(image: UIImage(named: "the-twins"), title: "Спрашивающий\n The Twins", description: "As a rule, the Chariot card is usually awarded to people who are really eager to find themselves, reaching for something new, and they are literally overflowing with energy and enthusiasm. They are active and optimistic, and always strive to achieve their goals, not just professionally, but also in their relationships.")
            }
            .padding(.horizontal, 16)
            .padding(.top, 92)
        }
        .background {
            ZStack {
                Color.Background.black.ignoresSafeArea()
                Image("pentagon-background").ignoresSafeArea()
            }
        }
    }
    
    private enum Constants {
        static let lightHeight = 200.0
        static let lightWidth = 20.0
    }
}

struct TaroPredictionPage_Previews: PreviewProvider {
    static var previews: some View {
        TaroPredictionPage()
    }
}
