//
//  Injection.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

final class Injection: NSObject {
    
    private func provideDataSource() -> FoodDataSourceProtocol {
        return FoodDataSource()
    }
    
    private func provideRepository() -> FoodRepositoryProtocol {
        let foodDataSource = provideDataSource()
        return FoodRepository(dataSource: foodDataSource)
    }
    
    func provideInteractor() -> FoodUseCase {
        let foodRepository = provideRepository()
        return FoodInteractor(repository: foodRepository)
    }
}
