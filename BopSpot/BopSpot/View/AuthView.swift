//
//  AuthView.swift
//  BopSpot
//
//  Created by Anıl Aygün on 26.11.2025.
//

import SwiftUI

struct AuthView: View {
    
    @State private var viewModel = AuthViewModel()
    
    var body: some View {
        
        NavigationStack(path: $viewModel.navigationPath) {
            
            ZStack {
                
                Color(uiColor: .systemBackground).edgesIgnoringSafeArea(.all)
                
                EmailView(viewModel: viewModel)
            }
            .navigationDestination(for: AuthStep.self) { step in
                switch step {
                case .emailInput:
                    EmailView(viewModel: viewModel)
                case .otpInput:
                    OTPView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    AuthView()
}
