//
//  CryptoWalletView.swift
//  Assignment
//
//  Created by Hassan Azhar on 20/03/2025.
//

import SwiftUI
import SwiftUI

struct OnBoardingView: View {
    @State private var showDashboard = false // State to control view replacement
    
    var body: some View {
        Group {
            if showDashboard {
                CryptoDashboardView()
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Image("iconPhone")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Your personal crypto wallet")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("It's secure and supports nearly a hundred cryptocurrencies")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                        
                        Button(action: {
                            withAnimation {
                                UserDefaults.standard.set(true,forKey: "hasCompletedOnboarding")
                                showDashboard = true
                            }
                        }) {
                            HStack {
                                Text("Get Started")
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .background(Constants.primaryColor)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        }
                        .padding(.top, 20)
                    }
                }
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
