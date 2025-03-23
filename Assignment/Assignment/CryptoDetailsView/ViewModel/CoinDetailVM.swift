//
//  CoinDetailVM.swift
//  Assignment
//
//  Created by Hassan Azhar on 23/03/2025.
//

import Foundation
import Combine
import Alamofire

class CoinAPI: ObservableObject {
    @Published var coinDetail: CoinDetail? = nil
    @Published var coinPriceHistory: PriceHistoryResponse? = nil
    @Published var isLoading: Bool = false
    @Published var error: String? = nil

    private var cancellables = Set<AnyCancellable>()

    func fetchDetailData(coinId: String) {
        self.isLoading = true
        self.error = nil
        self.coinDetail = nil
        self.coinPriceHistory = nil

        fetchCoinDetail(coinId: coinId)
        fetchPriceHistory(coinId: coinId)
    }

    private func fetchCoinDetail(coinId: String) {
        let url = Constants.getUrlForCoinDetail(id: coinId)
        AF.request(url)
            .validate()
            .responseDecodable(of: CoinDetail.self) { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let coinDetail):
                    self.coinDetail = coinDetail
                case .failure(let error):
                    self.error = error.localizedDescription
                }
                self.checkLoadingComplete()
            }
    }

    private func fetchPriceHistory(coinId: String) {
        let url = Constants.getPricesUrl(id: coinId)
        AF.request(url)
            .validate()
            .responseDecodable(of: PriceHistoryResponse.self) { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let priceHistory):
                    self.coinPriceHistory = priceHistory
                case .failure(let error):
                    self.error = error.localizedDescription
                }
                self.checkLoadingComplete()
            }
    }

    private func checkLoadingComplete() {
        if coinDetail != nil || error != nil, coinPriceHistory != nil || error != nil {
            self.isLoading = false
        }
    }
}
