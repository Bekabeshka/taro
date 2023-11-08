//
//  OtpCodeVerificationView.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import SwiftUI

struct OtpCodeVerificationView: View {
    @ObservedObject private var viewModel: OtpCodeVerificationViewModel
    
    init(viewModel: OtpCodeVerificationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.Background.black.ignoresSafeArea()
            VStack {
                OtpCodeView { otpCode in
                    print(otpCode)
                }
                Spacer()
                HStack(spacing: 12) {
                    Button("Did not get code?") {
                        // TODO: - Make transition
                    }
                    .foregroundColor(.Text.gray)
                    if viewModel.currentTimer == 0 {
                        Button("Reset") {
                            viewModel.generateOtp()
                        }
                    } else {
                        Text("Reset (\(viewModel.currentTimer) sec)")
                            .foregroundColor(.Text.lightGray)
                    }
                }
            }
            .padding(.screenInsets)
        }
        .onAppear {
            viewModel.generateOtp()
        }
    }
}

struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpCodeVerificationView(viewModel: OtpCodeVerificationViewModel())
    }
}

