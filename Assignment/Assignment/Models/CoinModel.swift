//
//  CoinModel.swift
//  Assignment
//
//  Created by Hassan Azhar on 21/03/2025.
//

import Foundation

struct Coin: Identifiable, Decodable {
    let id: String
    let name: String
    let symbol: String
    let current_price: Double
    let price_change_percentage_24h: Double
    let market_cap: Double
    let total_volume: Double
    let image: String
    let sparkline_in_7d: Sparkline?
}

struct Sparkline: Decodable {
    let price: [Double]
}
