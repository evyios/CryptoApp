//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Evgeny on 12.04.22.
//

import Foundation

struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    
    // nil добавдяем в init просто для того чтобы была возможность создавать экземпляр без константы percentage
    // без этого init по сути не нужен, потому что сам init это то что написано выше, Swift создаёт его в структуре автоматически
    init(title: String, value: String, percentage: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentage
    }
}

// вместо init выше можно использовать такую запись экземпляра
// let newModel = StatisticModels(title: "", value: "", percentage: nil)
