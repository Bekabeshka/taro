//
//  NativeAuthorizationPage.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import SwiftUI

struct NativeAuthorizationPage: View {
    @State private var phoneNumber: String?
    var didTapSendCode: ((String) -> Void)?
    private let counrties: [PhoneNubmer]
    private let defaultCountry: PhoneNubmer
    
    init(counrties: [PhoneNubmer], defaultCountry: PhoneNubmer) {
        self.counrties = counrties
        self.defaultCountry = defaultCountry
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                Color.Background.black.ignoresSafeArea()
                VStack {
                    PhoneNumberPage(
                        counrties: counrties,
                        defaultCountry: defaultCountry
                    ) { phoneNumber in
                        self.phoneNumber = phoneNumber
                    }
                    Spacer()
                    PrimaryButton(viewData: PrimaryButtonViewData(text: "Send Code"))
                    .foregroundColor(.Background.white)
                    .background(Color.Background.gray)
                    .cornerRadius(.cornerRadius)
                    .onTapGesture {
                        if let phoneNumber { didTapSendCode?(phoneNumber) }
                    }
                }
                .padding(.screenInsets)
            }
        }
    }
}

struct NativeAuthorizationPage_Previews: PreviewProvider {
    static var previews: some View {
        NativeAuthorizationPage(counrties: PhoneNubmer.allCountry, defaultCountry: .example)
    }
}
