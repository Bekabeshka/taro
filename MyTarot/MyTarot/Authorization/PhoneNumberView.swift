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
    let code: String
    let dial_code: String
    let pattern: String
    
    static let allCountry: [CPData] = [
        CPData(
            id: "0",
            name: "United Kingdom",
            flag: "🇬🇧",
            code: "GB",
            dial_code: "+44",
            pattern: "## #### ####"
        ),
        CPData(
            id: "1",
            name: "Kazakhstan",
            flag: "🇰🇿",
            code: "GB",
            dial_code: "+7",
            pattern: "(###) ###-##-##"
        ),
        CPData(
            id: "2",
            name: "United States",
            flag: "🇺🇸",
            code: "US",
            dial_code: "+1",
            pattern: "### ### ####"
        )
    ]
    static let example = allCountry[1]
}

struct PhoneNumberView: View {
    @State var presentSheet = false
    @State var countryCode : String = "+1"
    @State var countryFlag : String = "🇺🇸"
    @State var countryPattern : String = "### ### ####"
    @State var mobPhoneNumber = ""
    @State private var searchCountry: String = ""
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var keyIsFocused: Bool
    
    let counrties: [CPData] = CPData.allCountry
    
    var body: some View {
        ZStack {
            Color.Background.black.ignoresSafeArea()
            HStack(spacing: 42) {
                Spacer()
                
                Button {
                    presentSheet = true
                    keyIsFocused = false
                } label: {
                    HStack(spacing: 8) {
                        Text("\(countryFlag)")
                        Image("arrow-down")
                    }
                }
                
                TextField("", text: $mobPhoneNumber)
                    .placeholder(when: mobPhoneNumber.isEmpty) {
                        let temp = countryPattern.replacing("#", with: "7")
                        Text(temp)
                            .foregroundColor(.gray)
                    }
                    .focused($keyIsFocused)
                    .keyboardType(.numbersAndPunctuation)
                    .onReceive(Just(mobPhoneNumber)) { _ in
                        applyPatternOnNumbers(&mobPhoneNumber, pattern: countryPattern, replacementCharacter: "#")
                    }
//                    .padding(10)
//                    .frame(minWidth: 80, minHeight: 47)
                    .foregroundColor(.white)
                Spacer()
            }
//            .animation(.easeInOut(duration: 0.6), value: keyIsFocused)
//            .padding(.horizontal)
//            .onTapGesture {
//                hideKeyboard()
//            }
//            .sheet(isPresented: $presentSheet) {
//                NavigationView {
//                    List(filteredResorts) { country in
//                        HStack {
//                            Text(country.flag)
//                            Text(country.name)
//                                .font(.headline)
//                            Spacer()
//                            Text(country.dial_code)
//                                .foregroundColor(.secondary)
//                        }
//                        .onTapGesture {
//                            self.countryFlag = country.flag
//                            self.countryCode = country.dial_code
//                            self.countryPattern = country.pattern
//                            presentSheet = false
//                            searchCountry = ""
//                        }
//                    }
//                    .listStyle(.plain)
//                    .searchable(text: $searchCountry, prompt: "Your country")
//                }
//                .presentationDetents([.medium, .large])
//            }
//            .presentationDetents([.medium, .large])
            .ignoresSafeArea(.keyboard)
        }
    }
    
    var filteredResorts: [CPData] {
        if searchCountry.isEmpty {
            return counrties
        } else {
            return counrties.filter { $0.name.contains(searchCountry) }
        }
    }
    
    var foregroundColor: Color {
        if colorScheme == .dark {
            return Color(.white)
        } else {
            return Color(.black)
        }
    }
    
    var backgroundColor: Color {
        if colorScheme == .dark {
            return Color(.systemGray5)
        } else {
            return Color(.systemGray6)
        }
    }
    
    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        guard stringvar.count < pattern.count else {
            stringvar = String(stringvar.prefix(pattern.count))
            return
        }
        
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
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
        PhoneNumberView(
            countryCode: CPData.example.code,
            countryFlag: CPData.example.flag,
            countryPattern: CPData.example.pattern
        )
    }
}
