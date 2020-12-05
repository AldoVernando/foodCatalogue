//
//  FoodInteractor.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodUseCase {
    func getFoodList(page: Int) -> Observable<[FoodEntity]>
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity>
    func getFavoriteFood() -> Observable<[FoodData]>
    func addFavoriteFood(food: FoodData) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodInteractor: FoodUseCase {
    
    private let foodRepository: FoodRepositoryProtocol
    
    init(repository: FoodRepositoryProtocol) {
        self.foodRepository = repository
    }
    
    func getFoodList(page: Int = 0) -> Observable<[FoodEntity]> {
        return foodRepository.getFoodList(page: page)
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity> {
        return foodRepository.getFoodDetail(id: id)
    }
    
    func getFavoriteFood() -> Observable<[FoodData]> {
        return foodRepository.getFavoriteFood()
    }
    
    func addFavoriteFood(food: FoodData) -> Observable<Bool> {
        return foodRepository.addFavoriteFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return foodRepository.isFavorite(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return foodRepository.removeFavoriteFood(id: id)
    }
}
