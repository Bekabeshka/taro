//
//  SegmentedPickerView.swift
//  MyTarot
//
//  Created by Ilushk on 11.11.2023.
//

import SwiftUI

public struct SegmentedPicker<Element, Content>: View where Content: View {

    public typealias Data = [Element]

    @State private var frames: [CGRect]
    @Binding private var selectedIndex: Data.Index?

    private let data: Data
    private let content: (Data.Element, Bool) -> Content

    public init(_ data: Data,
                selectedIndex: Binding<Data.Index?>,
                @ViewBuilder content: @escaping (Data.Element, Bool) -> Content) {

        self.data = data
        self.content = content
        self._selectedIndex = selectedIndex
        self._frames = State(wrappedValue: Array(repeating: .zero,
                                                 count: data.count))
    }

    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .center,
                                    vertical: .center)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(data.indices, id: \.self) { index in
                        Button(action: { selectedIndex = index },
                               label: { content(data[index], selectedIndex == index) }
                        )
                        .buttonStyle(PlainButtonStyle())
                        .background(GeometryReader { proxy in
                            Color.clear.onAppear { frames[index] = proxy.frame(in: .global) }
                        })
                    }
                }
            }
        }
    }
}

struct SegmentItem {
    let title: String
    let badge: String
}

struct SegmentedPickerExample: View {
    let titles: [SegmentItem]
    @State var selectedIndex: Int = 0
    
    let cardCellViewData = CardCellViewData(
        imageUrl: nil,
        header: "How will my career develop",
        description: "2 cards reeding",
        badge: BadgeViewData(text: "Free"),
        isDisabled: false
    )

    var body: some View {
        SegmentedPicker(
            titles,
            selectedIndex: Binding(
                get: { selectedIndex },
                set: { selectedIndex = $0 ?? 0 }),
            content: { item, isSelected in
                HStack(spacing: 8) {
                    Text(item.title)
                        .foregroundColor(isSelected ? Color.Text.white : Color.Text.gray)
//                        .padding(.vertical, 8)
                    BadgeView(viewData: BadgeViewData(text: item.badge))
                        .font(Font.custom("SF Pro Display", size: 10).weight(.medium))
                        .foregroundColor(isSelected ? Color.Text.white : Color.Text.gray)
                        .frame(minWidth: 14)
                        .padding(Constant.insets)
                        .background(Color.badgeGray)
                        .cornerRadius(.badgeCR)
                        .opacity(isSelected ? 1 : 0.3)

                }
                .padding(Constant.padding)
                
            })
    }
}

private enum Constant {
    static let padding = EdgeInsets(top: 20, leading: 8, bottom: 20, trailing: 20)
    static let insets = EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
}

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerExample(titles: [
            SegmentItem(title: "All", badge: "23"),
            SegmentItem(title: "Love", badge: "13"),
            SegmentItem(title: "Free", badge: "3"),
            SegmentItem(title: "Love", badge: "13"),
            SegmentItem(title: "Free", badge: "3"),
            SegmentItem(title: "All", badge: "7")
        ])
            .background(Color.blue)
    }
}

