//
//  OTPView.swift
//  BopSpot
//
//  Created by Anıl Aygün on 26.11.2025.
//

import SwiftUI

struct OTPView: View {
    
    @Bindable var viewModel: AuthViewModel
    @FocusState private var isOtpFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            
            Spacer()
            
            Text("Verify your email")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("We've sent a 4-digit code to\n\(viewModel.email)")
                .font(.subheadline)
                .foregroundColor(.secondary)
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
                                .fill(Color(uiColor: .secondarySystemBackground))
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
                                .frame(width: 60, height: 70)
                           
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(isOtpFocused && viewModel.otpCode.count == index ? Color.primary : Color.clear, lineWidth: 1)
                                )
                            
                            if index < viewModel.otpCode.count {
                                let startIndex = viewModel.otpCode.index(viewModel.otpCode.startIndex, offsetBy: index)
                                Text(String(viewModel.otpCode[startIndex]))
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
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
                        .foregroundColor(.secondary)
                    Text("Resend")
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
            }
            
            Button(action: {
                print("verify code")})
            {
                Text("Verify Code")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.primary)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
