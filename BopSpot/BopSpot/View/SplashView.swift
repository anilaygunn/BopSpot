//
//  SplashView.swift
//  BopSpot
//
//  Created by Anıl Aygün on 10.12.2025.
//

import Foundation
import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.03), lineWidth: 2)
                    .frame(width: 400, height: 400)
                Circle()
                    .stroke(Color.white.opacity(0.03), lineWidth: 2)
                    .frame(width: 600, height: 600)
                Circle()
                    .stroke(Color.white.opacity(0.02), lineWidth: 50)
                    .frame(width: 800, height: 800)
                    .blur(radius: 50)
            }
            
            VStack(spacing: 40) {
                
                Image("BopSpotLogo")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .cornerRadius(35)
                    .foregroundStyle(.white)
                    
                   
                    .shadow(color: Color.white.opacity(0.6), radius: 45, x: 0, y: 0)
                
                VStack(spacing: 15) {
                    Text("BOP SPOT")
                        .font(.system(size: 42, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                    
                    
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color(red: 0.2, green: 0.8, blue: 0.2)) 
                            .frame(width: 8, height: 8)
                        
                        Text("CALIBRATING LOCAL FREQUENCIES")
                            .font(.system(size: 14, weight: .medium, design: .monospaced))
                            .foregroundColor(.gray)
                            .textCase(.uppercase)
                            
                            .kerning(1.2)
                    }
                }
            }
            .offset(y: -20)
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
