//
//  PorfolioCardView.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//
// MARK: - Portfolio Card View
import SwiftUI

struct PortfolioCard: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0) {
                    Text(coin.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(coin.symbol)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            
            if let prices = coin.sparkline_in_7d?.price {
                LineChartView(prices: prices)
                    .frame(height: 40) // Adjust for proper display
            }
            
            Spacer()
            
            HStack {
                Text("$\(coin.current_price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
                Text("\(coin.price_change_percentage_24h, specifier: "%.2f")%")
                    .foregroundColor(coin.price_change_percentage_24h > 0 ? .green : .red)
            }
        }
        .padding()
        .frame(width: 210, height: 170)
        .background(
            ZStack {
                BlurView(style: .systemUltraThinMaterial)
                Color.white.opacity(0.12)
            }
        )
        .cornerRadius(12)
    }
}

// Helper View for Blur Effect
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
