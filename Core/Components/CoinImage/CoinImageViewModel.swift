//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Evgeny on 11.04.22.
//

import Foundation
import SwiftUI
import Combine


class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoaded: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoaded = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoaded = false
            } receiveValue: { [weak self] returrnedImage in
                self?.image = returrnedImage
            }
            .store(in: &cancellables)

    }
}
