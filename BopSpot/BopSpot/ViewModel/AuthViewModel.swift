//
//  AuthViewModel.swift
//  BopSpot
//
//  Created by Anıl Aygün on 10.12.2025.
//

import Foundation
import Observation
import SwiftUI

enum AuthStep{
    case emailInput
    case otpInput
}

@Observable
class AuthViewModel {
    var email: String = ""
    var otpCode: String = ""
    var currentStep: AuthStep = .emailInput
    
    func continueWithEmail() {
            
        guard !email.isEmpty else { return }
            
        withAnimation(.easeInOut(duration: 0.4)) {
            currentStep = .otpInput
        }
            
        print("Kod gönderildi: \(email)")
    }

}
