//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Evgeny on 11.04.22.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    // 1. getCoins func is going to get this URL
    func getCoins() {
        guard let url = URL(string:  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        
        coinSubscription = NetworkingManager.download(url: url)
        // 4. If we get good data it's going to try to decode it into coin model
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
        // 5. If we have an error, it's going to print an error, otherwise it will append the return coins to allCoins array
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
        })
    }
}
