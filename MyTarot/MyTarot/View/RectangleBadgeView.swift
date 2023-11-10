//
//  RectangleBadgeView.swift
//  MyTarot
//
//  Created by Ilushk on 07.11.2023.
//

import SwiftUI

struct RectangleBadgeView: View {
    let viewData: BadgeViewData
    var body: some View {
        Text(viewData.text)
            .font(Font.custom("Inter", size: 14).weight(.semibold))
            .lineSpacing(18)
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))

    }
}
