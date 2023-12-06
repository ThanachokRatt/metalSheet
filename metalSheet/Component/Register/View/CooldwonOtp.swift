//
//  CooldwonOtp.swift
//  metalSheet
//
//  Created by Schweppe on 6/11/2566 BE.
//

import SwiftUI

struct CooldwonOtp: View {
    @State private var cooldownTimer: Timer?
    @State private var remainingCooldownTime = 60
    @EnvironmentObject var otpViewModel: OtpViewModel
    var body: some View {
        VStack {
            Button {
                if remainingCooldownTime == 0 {
              
                    var user = RegisterModel()
                    user.email = otpViewModel.email
                    
                    otpViewModel.sendOtp(user: user) {
                        
                    }
                    remainingCooldownTime = 60
                } else {
                    // Handle the "ถัดไป" or "ส่งอีกครั้ง" action
                    // ...
                }
            } label: {
                Text(cooldownButtonText())
                    .fontWeight(.bold)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black).opacity(0.8)
            }
            .disabled(remainingCooldownTime > 0) // Disable the button during cooldown
        }
        .onAppear {
            startCooldownTimer()
        }
        .onDisappear {
            cooldownTimer?.invalidate() // Clean up the timer when the view disappears
        }
    }

    private func startCooldownTimer() {
        cooldownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingCooldownTime > 0 {
                remainingCooldownTime -= 1
            }
        }
    }

    private func cooldownButtonText() -> String {
        if remainingCooldownTime > 0 {
            return "ส่งรหัสใหม่ (00:\(remainingCooldownTime))"
        } else {
            return "ส่งอีกครั้ง"
        }
    }
}


/*#Preview {
    CooldwonOtp()
        .environmentObject(OtpViewModel())
}*/
