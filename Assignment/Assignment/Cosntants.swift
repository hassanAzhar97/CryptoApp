//
//  Cosntants.swift
//  Assignment
//
//  Created by Hassan Azhar on 20/03/2025.
//
import SwiftUI

struct Constants {
        
    static let primaryColor = Color(red:0, green:244, blue:200)
    
    static let urlForCoinsList = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true"
    
    static func getUrlForCoinDetail(id: String) -> String {
        return  "https://api.coingecko.com/api/v3/coins/\(id)"
    }
    
    static func getPricesUrl(id: String) -> String {
        return "https://api.coingecko.com/api/v3/coins/\(id)/market_chart?vs_currency=usd&days=7"
    }
    
}
