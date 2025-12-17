//
//  AuthViewModel.swift
//  BopSpot
//
//  Created by Anıl Aygün on 10.12.2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class AuthViewModel {
    var email: String = ""
    var otpCode: String = ""
    var navigationPath = NavigationPath()
    
    func continueWithEmail() {
        guard !email.isEmpty else { return }
        navigationPath.append(AuthStep.otpInput)
        print("Kod gönderildi: \(email)")
    }
}

enum AuthStep: Hashable {
    case emailInput
    case otpInput
}
