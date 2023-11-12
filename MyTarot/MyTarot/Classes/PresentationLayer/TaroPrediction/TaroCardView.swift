//
//  TaroCardView.swift
//  MyTarot
//
//  Created by bekabeshka on 12.11.2023.
//

import SwiftUI

struct TaroCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                Image("the-twins")
                    .frame(width: 55, height: 100)
                Text("Спрашивающий\n The Twins")
                    .font(.custom("Sora-SemiBold", size: 25))
                    .foregroundColor(Color(hex: "F4F8F4"))
            }
            Text("As a rule, the Chariot card is usually awarded to people who are really eager to find themselves, reaching for something new, and they are literally overflowing with energy and enthusiasm. They are active and optimistic, and always strive to achieve their goals, not just professionally, but also in their relationships.")
                .font(.custom("Sora-Light", size: 16))
                .foregroundColor(Color(hex: "F4F8F4").opacity(0.3))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(Color(hex: "302D2D").opacity(0.2))
        .cornerRadius(8)
    }
}

struct TaroCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaroCardView()
    }
}
