//
//  ApiCoinService.swift
//  Assignment
//
//  Created by Hassan Azhar on 21/03/2025.
//

import Alamofire
import Foundation
import RxSwift

class ApiCoinService: ObservableObject {
    @Published var coins: [Coin] = []
    
    func fetchCoins() {
        AF.request(Constants.urlForCoinsList)
            .validate()
            .responseDecodable(of: [Coin].self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.coins = data
                    }
                case .failure(let error):
                    print("Error fetching coins: \(error)")
                }
            }
    }
    
}
