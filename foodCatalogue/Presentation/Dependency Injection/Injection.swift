//
//  Injection.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideRemoteDataSource() -> RemoteDataSourceProtocol {
        return RemoteDataSource()
    }
    
    private func provideLocaleDataSource() -> LocaleDataSourceProtocol {
        let realm = try? Realm()
        return LocaleDataSource(realm: realm)
    }
    
    private func provideRepository() -> FoodRepositoryProtocol {
        let remote = provideRemoteDataSource()
        let locale = provideLocaleDataSource()
        return FoodRepository(remote: remote, locale: locale)
    }
    
    func provideInteractor() -> FoodUseCase {
        let foodRepository = provideRepository()
        return FoodInteractor(repository: foodRepository)
    }
}
