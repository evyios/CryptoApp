//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Evgeny on 13.04.22.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntitys: [PortfolioEntity] = []
    
    
    init() {
        container = NSPersistentContainer(name: containerName) // Создание контейнера для хранения данных
        container.loadPersistentStores { _, error in
            // Если у нас есть ошибка, напечатай...
            if let error = error {
                print("Error loadind Core Data. \(error)")
            }
            self.getPortfolio()
        }
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        // check if coin is already in portfolio
        if let entity = savedEntitys.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                remove(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntitys = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching portfolio Entity. \(error)")
        }
    }
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func remove(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to core data. \(error)")
        }
    }
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
