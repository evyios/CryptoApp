//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Evgeny on 16.04.22.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    // 1. getCoinDetails func is going to get this URL
    func getCoinDetails() {
        guard let url = URL(string:  "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        
        coinDetailSubscription = NetworkingManager.download(url: url)
        // 4. If we get good data it's going to try to decode it into coin model
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
        // 5. If we have an error, it's going to print an error, otherwise it will append the return coins to allCoins array
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
        })
    }
}
