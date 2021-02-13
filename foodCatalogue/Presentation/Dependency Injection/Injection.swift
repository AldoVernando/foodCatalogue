//
//  Injection.swift
//  foodCatalogue
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideLocaleDataSource() -> LocaleDataSourceProtocol {
        let realm = try? Realm()
        return LocaleDataSource(realm: realm)
    }
    
    private func provideRepository() -> FoodRepositoryProtocol {
        let locale = provideLocaleDataSource()
        return FoodRepository(locale: locale)
    }
    
    func provideInteractor() -> FoodUseCase {
        let foodRepository = provideRepository()
        return FoodInteractor(repository: foodRepository)
    }
}
