//
//  CoinDetailModel.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//
import Foundation

struct CoinDetail: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let marketCapRank: Int
    let marketData: MarketData
    let image: CoinImage

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case marketCapRank = "market_cap_rank"
        case marketData = "market_data"
    }
}

struct MarketData: Codable {
    let currentPrice: Price
    let marketCap: Price
    let totalVolume: Price
    let priceChangePercentage24h: Double

    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
}

struct Price: Codable {
    let usd: Double
}

struct CoinImage: Codable {
    let thumb: String
    let small: String
    let large: String
}
