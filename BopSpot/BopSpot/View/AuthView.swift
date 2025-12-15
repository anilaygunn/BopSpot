//
//  AuthView.swift
//  BopSpot
//
//  Created by Anıl Aygün on 26.11.2025.
//

import SwiftUI

struct AuthView: View {
    @State private var viewModel = AuthViewModel()
    @FocusState private var isOtpFocused: Bool
    
    var body: some View {
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if viewModel.currentStep == .emailInput {
                    emailInputView
                        .transition(.move(edge: .leading))
                } else {
                    otpInputView
                        .transition(.move(edge: .trailing))
                }
            }
        }
    }
    
    // MARK: - VARIABLE: EMAIL SCREEN
    var emailInputView: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("BopSpotLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 24)
            
            Text("Sign in to BopSpot")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.black)
                .padding(.bottom, 12)
            
            Text("Enter your email to continue to the app")
                .font(.system(size: 16))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            TextField("name@example.com", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            
            Button(action: {
                viewModel.continueWithEmail()
            }) {
                Text("Continue with Email")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Text("By clicking continue, you agree to our Terms of Service and Privacy Policy.")
                .font(.system(size: 13))
                .foregroundStyle(.gray.opacity(0.6))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
        }
    }
    
    // MARK: - VARIABLE: OTP Screen
    var otpInputView: some View {
        VStack(spacing: 30) {
            
           
            HStack {
                Button(action: { print("go back") }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            
            Spacer()
            
            
            Text("Verify your email")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
           
            Text("We've sent a 4-digit code to\n\(viewModel.email)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            
            ZStack {
         
                TextField("", text: $viewModel.otpCode)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .focused($isOtpFocused)
                    .opacity(0)
                    .onChange(of: viewModel.otpCode){ newValue in
                        if newValue.count > 4 {
                            viewModel.otpCode = String(newValue.prefix(4))
                        }
                    }
                
            
                HStack(spacing: 15) {
                    ForEach(0..<4, id: \.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
                                .frame(width: 60, height: 70)
                           
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(isOtpFocused && viewModel.otpCode.count == index ? Color.black : Color.clear, lineWidth: 1)
                                )
                            
                            if index < viewModel.otpCode.count {
                                let startIndex = viewModel.otpCode.index(viewModel.otpCode.startIndex, offsetBy: index)
                                Text(String(viewModel.otpCode[startIndex]))
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            }
                        }
                        .onTapGesture {
                            isOtpFocused = true
                        }
                    }
                }
            }
            .padding(.vertical, 20)
            .onAppear {

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isOtpFocused = true
                }
            }
            
            
            Button(action: {
                print("Resend code tapped")
            }) {
                HStack(spacing: 4) {
                    Text("Didn't receive code?")
                        .foregroundColor(.gray)
                    Text("Resend")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
            
          
            Button(action: {
                print("verify code")})
            {
                Text("Verify Code")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
    }
}

#Preview {
    AuthView()
}
