//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Evgeny on 13.04.22.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    // 1. getCoins func is going to get this URL
        func getData() {
        guard let url = URL(string:  "https://api.coingecko.com/api/v3/global") else { return }
        
        
        marketDataSubscription = NetworkingManager.download(url: url)
        // 4. If we get good data it's going to try to decode it into coin model
            .decode(type: GlobalData.self, decoder: JSONDecoder())
        // 5. If we have an error, it's going to print an error, otherwise it will append the return coins to allCoins array
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
        })
    }
}
