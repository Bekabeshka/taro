//
//  UserGreetingView.swift
//  MyTarot
//
//  Created by Ilushk on 07.11.2023.
//

import SwiftUI

struct UserGreetingViewData {
    let image: String //url
    let text: String
}

struct UserGreetingView: View {
    let viewData: UserGreetingViewData
    
    var body: some View {
        HStack(spacing: 12) {
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 21, height: 21)
                    .background(Image(viewData.image))
            Text(viewData.text)
                    .font(Font.custom("SF Pro Display", size: 18))
                    .tracking(0.54)
                    .foregroundColor(Color.Text.white)
            Spacer()
            }
            .padding(Constants.padding)
            .frame(width: .infinity, height: 21)
    }
}

private enum Constants {
    static let padding = EdgeInsets(top: 0, leading: 8, bottom: 24, trailing: 8)
}

struct UserGreetingView_Previews: PreviewProvider {
    static var previews: some View {
        UserGreetingView(viewData: UserGreetingViewData(image: "user-pic", text: "Hey, Amanda"))
    }
}
