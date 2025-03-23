//
//  Untitled.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//

import SwiftUI

struct ReferralBannerView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Constants.primaryColor)
                .frame(maxHeight: .infinity)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Refer Rewards")
                        .bold()
                        .foregroundColor(.black)
                    Text("Earn 5$ rewards on every successful refer")
                        .foregroundColor(.black)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                Image("iconTwoFingers")
                    .resizable()
                    .aspectRatio(0.56, contentMode: .fit)
                    .frame(width: 80)
            }
            .padding(.trailing, 40)
            Button(action: {
                print("Cross button tapped")
            }) {
                Image(systemName: "multiply")
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color.clear)
                    .clipShape(Circle())
            }
            .padding(.trailing, 10)
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Market Stats View
struct MarketStatsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Market Statistics")
                .bold()
                .font(.title3)
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(["24 hrs", "Hot", "Profit", "Rising", "Loss", "Top Gain"], id: \.self) { category in
                        Text(category)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .frame(height: 25)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray.opacity(0.3)))
                    }
                }
            }
        }
        .padding()
    }
}
