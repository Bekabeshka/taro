//
//  OtpCodeVerificationViewModel.swift
//  MyTarot
//
//  Created by bekabeshka on 07.11.2023.
//

import Foundation

final class OtpCodeVerificationViewModel: ObservableObject {
    private var timer: Timer?
    
    @Published var currentTimer = Constants.timeLimit
    
    func generateOtp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.startTimer()
        }
    }
    
    private func startTimer() {
        currentTimer = Constants.timeLimit
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timerTick()
        }
    }
    
    private func timerTick() {
        if currentTimer == 0 {
            timer?.invalidate()
        } else {
            currentTimer -= 1
        }
    }
    
    private enum Constants {
        static let timeLimit = 10
    }
}
