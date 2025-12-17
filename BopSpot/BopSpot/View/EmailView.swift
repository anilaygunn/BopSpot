//
//  EmailView.swift
//  BopSpot
//
//  Created by Anıl Aygün on 26.11.2025.
//

import SwiftUI

struct EmailView: View {
    
    @Bindable var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("BopSpotLogo")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 24)
                .foregroundStyle(.primary)
                
            Text("Sign in to BopSpot")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.primary)
                .padding(.bottom, 12)
            
            Text("Enter your email to continue to the app")
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            TextField("", text: $viewModel.email, prompt: Text("name@example.com").foregroundColor(.gray))

                .foregroundStyle(.primary)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            
            Button(action: {
                viewModel.continueWithEmail()
            }) {
                Text("Continue with Email")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.primary)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Text("By clicking continue, you agree to our Terms of Service and Privacy Policy.")
                .font(.system(size: 13))
                .foregroundStyle(.secondary.opacity(0.6))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
        }
        .navigationBarHidden(true)
    }
}
