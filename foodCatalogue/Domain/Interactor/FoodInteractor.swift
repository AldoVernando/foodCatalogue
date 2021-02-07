//
//  FoodInteractor.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodUseCase {
    func getFoodList(keyword: String, page: Int) -> Observable<[FoodModel]>
    func getFoodDetail(id: String) -> Observable<FoodDetailModel>
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
    
    func getFoodList(keyword: String = "", page: Int = 0) -> Observable<[FoodModel]> {
        return foodRepository.getFoodList(keyword: keyword, page: page)
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailModel> {
        return foodRepository.getFoodDetail(id: id)
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
