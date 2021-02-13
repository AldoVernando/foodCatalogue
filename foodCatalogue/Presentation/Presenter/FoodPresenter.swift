//
//  FoodPresenter.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift
import FoodCatalogueModule

protocol FoodFavoritePresenterProtocol {
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodFavoritePresenter: FoodFavoritePresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    init() {
        self.foodInteractor = Injection.init().provideInteractor()
    }
    
    func getFavoriteFood() -> Observable<[FoodModel]> {
        return foodInteractor.getFavoriteFood()
    }
    
    func addFavoriteFood(food: FoodModel) -> Observable<Bool> {
        return foodInteractor.addFavoriteFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return foodInteractor.isFavorite(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return foodInteractor.removeFavoriteFood(id: id)
    }
}
