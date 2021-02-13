//
//  FoodInteractor.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift
import FoodCatalogueModule

protocol FoodUseCase {
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodInteractor: FoodUseCase {
    
    private let foodRepository: FoodRepositoryProtocol
    
    init(repository: FoodRepositoryProtocol) {
        self.foodRepository = repository
    }
    
    func getFavoriteFood() -> Observable<[FoodModel]> {
        return foodRepository.getFavoriteFood()
    }
    
    func addFavoriteFood(food: FoodModel) -> Observable<Bool> {
        return foodRepository.addFavoriteFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return foodRepository.isFavorite(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return foodRepository.removeFavoriteFood(id: id)
    }
}
