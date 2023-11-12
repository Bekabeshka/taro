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
                TaroCardView()
                    .padding(.horizontal, 16)
                TaroCardView()
                    .padding(.horizontal, 16)
                TaroCardView()
                    .padding(.horizontal, 16)
            }
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
