//
//  PhoneNumberPage.swift
//  MyTarot
//
//  Created by bekabeshka on 08.11.2023.
//

import SwiftUI
import Combine

struct PhoneNumberPage: View {
    @State var presentSheet = false
    @State var phoneNumber = ""
    @State private var searchCountry: String = ""
    @FocusState private var keyIsFocused: Bool
    
    private let counrties: [PhoneNubmer]
    @State var selectedCountry: PhoneNubmer
    private let didEnterPhoneNumber: ((String) -> Void)
    
    var filteredResorts: [PhoneNubmer] {
        if searchCountry.isEmpty {
            return counrties
        } else {
            return counrties.filter { $0.name.contains(searchCountry) }
        }
    }
    
    init(counrties: [PhoneNubmer], defaultCountry: PhoneNubmer, didEnterPhoneNumber: @escaping ((String) -> Void)) {
        self.counrties = counrties
        self.selectedCountry = defaultCountry
        self.didEnterPhoneNumber = didEnterPhoneNumber
    }
    
    var body: some View {
        PhoneNumberView(country: $selectedCountry) {
            presentSheet = true
        } didEnterPhoneNumber: { phoneNumber in
            didEnterPhoneNumber(phoneNumber)
        }
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $presentSheet) {
            NavigationView {
                List(filteredResorts) { country in
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                            .font(.headline)
                        Spacer()
                        Text(country.dialCode)
                            .foregroundColor(.secondary)
                    }
                    .onTapGesture {
                        selectedCountry = country
                        presentSheet = false
                        searchCountry = ""
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchCountry, prompt: "Your country")
            }
            .presentationDetents([.medium, .large])
        }
        .presentationDetents([.medium, .large])
    }
    
    var foregroundColor: Color {
        return Color(.white)
    }
    
    var backgroundColor: Color {
        return Color(.systemGray5)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct PhoneNumberPage_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberPage(counrties: PhoneNubmer.allCountry, defaultCountry: .example, didEnterPhoneNumber: { _ in })
    }
}
