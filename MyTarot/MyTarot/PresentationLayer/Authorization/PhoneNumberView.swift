//
//  PhoneNumberView.swift
//  MyTarot
//
//  Created by bekabeshka on 08.11.2023.
//

import SwiftUI
import Combine

struct CPData: Codable, Identifiable {
    let id: String
    let name: String
    let flag: String
    let dialCode: String
    let pattern: String
    
    static let allCountry: [CPData] = [
        CPData(
            id: "0",
            name: "United Kingdom",
            flag: "🇬🇧",
            dialCode: "+44",
            pattern: "## #### ##"
        ),
        CPData(
            id: "1",
            name: "Kazakhstan",
            flag: "🇰🇿",
            dialCode: "+7",
            pattern: "(###) ###-##-##"
        ),
        CPData(
            id: "2",
            name: "United States",
            flag: "🇺🇸",
            dialCode: "+1",
            pattern: "### ### ####"
        )
    ]
    static let example = allCountry[1]
}

struct PhoneNumber: View {
    @State private var phoneNumber = ""
    @FocusState private var keyIsFocused: Bool
    
    @Binding var country: CPData
    let buttonAction: (() -> Void)
    let didEnterPhoneNumber: ((String) -> Void)
    
    var body: some View {
        HStack {
            Button {
                buttonAction()
                keyIsFocused = false
            } label: {
                Text("\(country.flag) \(country.dialCode)")
                    .padding(10)
                    .frame(minWidth: 80, minHeight: 47)
                    .background(Color.Background.gray, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .foregroundColor(.Text.white)
            }
            
            TextField("", text: $phoneNumber)
                .placeholder(when: phoneNumber.isEmpty) {
                    Text("Phone number")
                        .foregroundColor(.Text.gray)
                }
                .focused($keyIsFocused)
                .keyboardType(.numbersAndPunctuation)
                .onReceive(Just(phoneNumber)) { _ in
                    applyPatternOnNumbers(&phoneNumber, replacementCharacter: "#")
                }
                .onReceive(Just(phoneNumber)) { _ in
                    if phoneNumber.count == country.pattern.count {
                        didEnterPhoneNumber(phoneNumber)
                    }
                }
                .foregroundColor(.Text.white)
                .padding(10)
        }
    }
    
    private func applyPatternOnNumbers(_ stringvar: inout String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< country.pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: country.pattern)
            let patternCharacter = country.pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        
        if stringvar.count < country.pattern.count {
            stringvar = String(pureNumber.prefix(country.pattern.count))
        } else {
            stringvar = pureNumber
        }
    }
}

struct PhoneNumberView: View {
    @State var presentSheet = false
    @State var selectedCountry: CPData
    @State var phoneNumber = ""
    @State private var searchCountry: String = ""
    @FocusState private var keyIsFocused: Bool
    
    let counrties = CPData.allCountry
    
    init(selectedCountry: CPData) {
        self.selectedCountry = selectedCountry
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.Background.black.ignoresSafeArea()
                PhoneNumber(country: $selectedCountry) {
                    presentSheet = true
                } didEnterPhoneNumber: { phoneNumber in
                    print("AYA", phoneNumber)
                }
            }
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
    
    var filteredResorts: [CPData] {
        if searchCountry.isEmpty {
            return counrties
        } else {
            return counrties.filter { $0.name.contains(searchCountry) }
        }
    }
    
    var foregroundColor: Color {
        return Color(.white)
    }
    
    var backgroundColor: Color {
        return Color(.systemGray5)
    }
//
//    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
//        guard stringvar.count < pattern.count else {
//            return stringvar = String(stringvar.prefix(pattern.count))
//        }
//        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
//        for index in 0 ..< pattern.count {
//            guard index < pureNumber.count else {
//                stringvar = pureNumber
//                return
//            }
//            let stringIndex = String.Index(utf16Offset: index, in: pattern)
//            let patternCharacter = pattern[stringIndex]
//            guard patternCharacter != replacementCharacter else { continue }
//            pureNumber.insert(patternCharacter, at: stringIndex)
//        }
//        stringvar = pureNumber
//    }
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
extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}
struct OnboardingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous )
                .frame(height: 49)
                .foregroundColor(Color(.systemBlue))
            
            configuration.label
                .fontWeight(.semibold)
                .foregroundColor(Color(.white))
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(selectedCountry: .example)
    }
}
