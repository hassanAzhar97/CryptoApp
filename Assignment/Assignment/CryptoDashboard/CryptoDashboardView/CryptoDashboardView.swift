//
//  extensions.swift
//  Assignment
//
//  Created by Hassan Azhar on 20/03/2025.
//
import SwiftUI

struct CryptoDashboardView: View {
    @StateObject private var coinService = ApiCoinService() // Manages coin data
    @State private var selectedTab = 0 // Tracks selected tab
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - Profile Section
                    HStack {
                        Image("iconProfilePic")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Portfolio Balance
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Portfolio Balance")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        HStack {
                            Text("$12,550.50")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                            
                            Spacer()
                            
                            CapsuleButton(text: "^ 10.75%", backgroundColor: Constants.primaryColor.opacity(0.3), textColor: .black)
                        }
                        
                        HStack {
                            Text("My Portfolio")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            
                            Spacer()
                            
                            Text("Monthly")
                                .foregroundColor(Constants.primaryColor)
                                .font(.system(size: 14, weight: .medium))
                            
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 10, height: 5)
                                .foregroundColor(Constants.primaryColor)
                        }
                        .padding(.vertical, 20)
                        if let card = coinService.coins.first {
                            PortfolioCard(coin: card)
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Market Statistics Section
                    VStack {
                        // MARK: - Referral Banner
                        ReferralBannerView()
                            .padding(.horizontal, 30)
                        
                        // MARK: - Market Stats
                        MarketStatsView()
                        
                        // MARK: - Coin List
                        
                        ForEach(coinService.coins) { coin in
                            NavigationLink(destination: CryptoDetailView(coinId: coin.id).id(coin.id)) {
                                CoinRowView(coin: coin)
                            }
                        }
                    }
                }
                .background(Color.black)
            }
            .onAppear {
                coinService.fetchCoins() // Fetch coins when the view appears
            }
            .background(Color.black)
        }
        .background(Color.black)
        
        // MARK: - Custom Tab Bar
        CustomTabBar(selectedTab: $selectedTab)
            .background(Color.black)
    }
}

struct CoinRowView: View {
    let coin: Coin 
    
    var body: some View {
        HStack {
            // Coin Image
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())

            // Coin Name and Symbol
            VStack(alignment: .leading) {
                Text(coin.name)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(coin.symbol.uppercased())
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            
            // Sparkline Chart
            if let prices = coin.sparkline_in_7d?.price {
                LineChartView(prices: prices)
                    .frame(height: 40)
            }

            Spacer()

            // Coin Price and Percentage Change
            VStack(alignment: .trailing) {
                Text("$\(coin.current_price, specifier: "%.2f")")
                    .foregroundColor(.white)
                    .bold()

                Text("\(coin.price_change_percentage_24h, specifier: "%.2f")%")
                    .foregroundColor(coin.price_change_percentage_24h >= 0 ? .green : .red)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
    }
}
