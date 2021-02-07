//
//  FoodPresenter.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodPresenterProtocol {
    func getFoodList(keyword: String, page: Int) -> Observable<[FoodModel]>
    func getFoodDetail(id: String) -> Observable<FoodDetailModel>
    func getNutrients(nutrients: TotalNutrientsModel) -> [NutrientDetailModel]
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodPresenter: FoodPresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    init() {
        self.foodInteractor = Injection.init().provideInteractor()
    }
    
    func getFoodList(keyword: String = "-", page: Int = 0) -> Observable<[FoodModel]> {
        return foodInteractor.getFoodList(keyword: keyword, page: page)
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailModel> {
        return foodInteractor.getFoodDetail(id: id)
    }
    
    func getNutrients(nutrients: TotalNutrientsModel) -> [NutrientDetailModel] {
        var nutrientArray: [NutrientDetailModel] = []
        nutrientArray.append(nutrients.energy)
        nutrientArray.append(nutrients.protein)
        nutrientArray.append(nutrients.fat)
        nutrientArray.append(nutrients.fatrn)
        nutrientArray.append(nutrients.carbs)
        nutrientArray.append(nutrients.chole)
        nutrientArray.append(nutrients.fiber)
        nutrientArray.append(nutrients.ribf)
        nutrientArray.append(nutrients.thia)
        nutrientArray.append(nutrients.sugar)
        nutrientArray.append(nutrients.water)
        nutrientArray.append(nutrients.fams)
        nutrientArray.append(nutrients.fasat)
        nutrientArray.append(nutrients.fapu)
        nutrientArray.append(nutrients.folac)
        nutrientArray.append(nutrients.folfd)
        nutrientArray.append(nutrients.foldfe)
        nutrientArray.append(nutrients.ca)
        nutrientArray.append(nutrients.zn)
        nutrientArray.append(nutrients.fe)
        nutrientArray.append(nutrients.k)
        nutrientArray.append(nutrients.mg)
        nutrientArray.append(nutrients.na)
        nutrientArray.append(nutrients.p)
        nutrientArray.append(nutrients.tocpha)
        nutrientArray.append(nutrients.vita_rae)
        nutrientArray.append(nutrients.vitc)
        nutrientArray.append(nutrients.vitd)
        nutrientArray.append(nutrients.vitk1)
        nutrientArray.append(nutrients.vitb64)
        
        return nutrientArray
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
