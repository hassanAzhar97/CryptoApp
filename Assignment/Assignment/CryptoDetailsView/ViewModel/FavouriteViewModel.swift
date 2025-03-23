//
//  FavouriteViewModel.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var favoriteCoins: Set<String> = []

    let defaultsKey = "FavoriteCoins"

    init() {
        loadFavorites()
    }

    func loadFavorites() {
        if let savedCoins = UserDefaults.standard.array(forKey: defaultsKey) as? [String] {
            favoriteCoins = Set(savedCoins)
        }
    }

    func toggleFavorite(coinID: String) {
        if favoriteCoins.contains(coinID) {
            favoriteCoins.remove(coinID)  // Remove
        } else {
            favoriteCoins.insert(coinID)  // Add
        }
        saveFavorites()
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteCoins), forKey: defaultsKey)
    }

    func isFavorite(coinID: String) -> Bool {
        return favoriteCoins.contains(coinID)
    }
}
