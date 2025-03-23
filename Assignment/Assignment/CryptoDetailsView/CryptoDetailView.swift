//
//  CryptoDetailView.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//

import SwiftUI
import Charts
import RxSwift

struct CryptoDetailView: View {
    let coinId: String
    @StateObject private var api = CoinAPI()
    @StateObject private var favoritesVM = FavoritesViewModel()
    @State private var selectedTimeframe: String = "1H"
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack {
            if api.isLoading {
                ProgressView("Loading...") // Show a loading spinner
                    .progressViewStyle(CircularProgressViewStyle())
            } else if let error = api.error {
                Text("Error: \(error)") // Show error message
                    .foregroundColor(.red)
            } else if let coin = api.coinDetail, let priceHistory = api.coinPriceHistory {
                HStack {
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.title2)
                            .foregroundColor(Constants.primaryColor)
                    }
                    Spacer()
                    Button(action: {
                        favoritesVM.toggleFavorite(coinID: coin.id)
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .font(.title2)
                            .foregroundColor(isFavorite ? Constants.primaryColor : .gray)
                    }
                }.padding(.horizontal)
                HStack {
                    AsyncImage(url: URL(string: coin.image.large)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.horizontal)
                    VStack(alignment: .leading) {
                        Text("\(coin.name) / \(coin.symbol.uppercased())")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("$\(coin.marketData.currentPrice.usd, specifier: "%.2f")")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    CapsuleButton(text: "^ \(coin.marketData.priceChangePercentage24h)", backgroundColor: Constants.primaryColor.opacity(0.3), textColor: .black)
                }.padding(.horizontal)
                
                
                // Market Stats
                HStack(spacing: 20) {
                    let marketCap = formatLargeNumber(coin.marketData.marketCap.usd)
                    let totalVolume = formatLargeNumber(coin.marketData.totalVolume.usd)
                    MarketStatView(title: "POPULARITY", value: "#\(coin.marketCapRank)")
                    MarketStatView(title: "MARKET CAP", value: "\(marketCap)")
                    MarketStatView(title: "VOLUME", value: "\(totalVolume)")
                }
                .padding(.top, 10)
                
                // Timeframe Selector
                HStack {
                    ForEach(["1H", "1D", "1W", "1M", "1Y", "All"], id: \.self) { timeframe in
                        Button(action: {
                            selectedTimeframe = timeframe
                        }) {
                            Text(timeframe)
                                .fontWeight(.bold)
                                .foregroundColor(selectedTimeframe == timeframe ? .white : .gray)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(selectedTimeframe == timeframe ? Color.gray.opacity(0.3) : Color.clear)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.vertical, 10)
                Spacer()
                let prices = priceHistory.prices.map({ $0[1] })
                    LineChartViw(prices: prices)
                        .frame(height: 200)
                        .padding(.horizontal)
                HStack {
                    Text("MIN $\(prices.min() ?? 0, specifier: "%.2f")")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("MAX $\(prices.max() ?? 0, specifier: "%.2f")")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                    .padding(.horizontal)
                    Spacer()
                    
                    // Transfer Button
                    Button(action: {
                        print("Transfer action")
                    }) {
                        Text("Transfer")
                            .fontWeight(.bold)
                            .background(Constants.primaryColor)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .frame(width: 300,height: 50)
                    }
                    .padding(.bottom, 20)
                }
            }
        .onAppear {
            api.fetchDetailData(coinId: self.coinId)
        favoritesVM.loadFavorites()
            isFavorite = favoritesVM.favoriteCoins.contains(coinId)
    }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    private func formatLargeNumber(_ value: Double) -> String {
        let billion = 1_000_000_000.0
        let million = 1_000_000.0
        let thousand = 1_000.0

        if value >= billion {
            return String(format: "$%.1fB", value / billion)
        } else if value >= million {
            return String(format: "$%.1fM", value / million)
        } else if value >= thousand {
            return String(format: "$%.1fK", value / thousand)
        } else {
            return String(format: "$%.2f", value)
        }
    }

}

// Market Stat View Component
struct MarketStatView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}


struct LineChartViw: View {
    let prices: [Double]

    var body: some View {
        Chart {
            ForEach(prices.indices, id: \.self) { index in
                LineMark(
                    x: .value("Time", index),
                    y: .value("Price", prices[index])
                )
                .foregroundStyle(.blue)
                
                AreaMark(
                    x: .value("Time", index),
                    yStart: .value("Base", 0),
                    yEnd: .value("Price", prices[index])
                )
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.black.opacity(0)]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(height: UIScreen.main.bounds.height/3)
        .background(Color.black.opacity(0.3))
        .cornerRadius(12)
    }
}
