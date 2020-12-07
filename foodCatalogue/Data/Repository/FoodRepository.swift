//
//  FoodRepository.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodRepositoryProtocol {
    func getFoodList(page: Int) -> Observable<[FoodResult]>
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity>
    func getFavoriteFood() -> Observable<[FoodData]>
    func addFavoriteFood(food: FoodData) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodRepository: FoodRepositoryProtocol {
    
    private let remote: RemoteDataSourceProtocol
    private let locale: LocaleDataSourceProtocol
    
    init(remote: RemoteDataSourceProtocol, locale: LocaleDataSourceProtocol) {
        self.remote = remote
        self.locale = locale
    }
    
    func getFoodList(page: Int = 0) -> Observable<[FoodResult]> {
        return remote.getFoodList(page: page)
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity> {
        return remote.getFoodDetail(id: id)
    }
    
    func getFavoriteFood() -> Observable<[FoodData]> {
        return locale.getFoods()
    }
    
    func addFavoriteFood(food: FoodData) -> Observable<Bool> {
        return locale.addFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return locale.isFoodExists(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return locale.removeFood(id: id)
    }
}
