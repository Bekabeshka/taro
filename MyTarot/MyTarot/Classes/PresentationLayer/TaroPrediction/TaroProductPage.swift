//
//  TaroProductPage.swift
//  MyTarot
//
//  Created by bekabeshka on 14.11.2023.
//

import SwiftUI

struct TaroProductPage: View {
    @State var isEnabled = true
    
    private let enabledButtonViewData = PrimaryButtonViewData(text: "Buy for $5", iconName: "apple-logo")
    private let disabledButtonViewData = PrimaryButtonViewData(text: "7 days 18 houers")
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                TaroDescription(
                    title: "How I'll feel\nin romantic relationships?",
                    description: "Текстовое описание расклада содержащее в себе 3 строки с коротким описанием"
                )
                Divider().background(Color(hex: "F4F8F4").opacity(0.03))
                HStack(spacing: 16) {
                    Image("the-twins")
                        .resizable(resizingMode: .tile)
                        .frame(width: 30, height: 42)
                    Text("Cards in read")
                        .font(.soraRegular(size: 14))
                        .foregroundColor(Color(hex: "F4F8F4"))
                    Spacer()
                    Text("3")
                        .font(.soraBold(size: 14))
                        .foregroundColor(Color(hex: "F4F8F4"))
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                Divider().background(Color(hex: "F4F8F4").opacity(0.03))
                HStack(spacing: 16) {
                    Image("tabler-cards")
                        .frame(width: 18, height: 18)
                        .background {
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(Color(hex: "1E1E1E"))
                                .frame(width: 30, height: 42)
                        }
                    VStack(alignment: .leading) {
                        Text("Cards in read")
                            .font(.soraRegular(size: 14))
                            .foregroundColor(Color(hex: "F4F8F4"))
                        Text("Cards in read")
                            .font(.custom("SF Pro Display", size: 12))
                            .foregroundColor(Color(hex: "666766"))
                    }
                    Spacer()
                    Image("forward-arrow")
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
            }
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(hex: "0F0E0E"))
            }
            PrimaryButton(viewData: isEnabled ? enabledButtonViewData: disabledButtonViewData)
                .foregroundColor(isEnabled ? .Text.white: Color(hex: "F0E051"))
                .font(.soraSemiBold(size: 16))
                .background {
                    if isEnabled {
                        LinearGradient(colors: [.Background.gradientRed, .Background.gradientOrange, .Background.gradientPink], startPoint: .leading, endPoint: .trailing)
                            .cornerRadius(8)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color(hex: "F0E051").opacity(0.35))
                    }
                }
                .padding(.bottom, 24)
                .onTapGesture {
                    isEnabled.toggle()
                }

        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.horizontal, 16)
        .background {
            ZStack {
                Color.Background.black.ignoresSafeArea()
                Image("pentagon-background").ignoresSafeArea()
            }
        }
    }
}

struct TaroProductPage_Previews: PreviewProvider {
    static var previews: some View {
        TaroProductPage()
    }
}

struct TaroDescription: View {
    let title: String
    let description: String
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.soraBold(size: 32))
                .foregroundColor(Color(hex: "F4F8F4"))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(description)
                .font(.soraLight(size: 20))
                .foregroundColor(Color(hex: "F4F8F4").opacity(0.3))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }
}
