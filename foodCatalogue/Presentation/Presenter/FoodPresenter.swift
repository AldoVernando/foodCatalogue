//
//  FoodPresenter.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodPresenterProtocol {
    func getFoodList(page: Int) -> Observable<[FoodEntity]>
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity>
    func getNutrients(nutrients: TotalNutrients) -> [NutrientDetailEntity?]
    func getFavoriteFood() -> Observable<[FoodData]>
    func addFavoriteFood(food: FoodData) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodPresenter: FoodPresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    init(interactor: FoodUseCase) {
        self.foodInteractor = interactor
    }
    
    func getFoodList(page: Int = 0) -> Observable<[FoodEntity]> {
        return foodInteractor.getFoodList(page: page)
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity> {
        return foodInteractor.getFoodDetail(id: id)
    }
    
    func getNutrients(nutrients: TotalNutrients) -> [NutrientDetailEntity?] {
        var nutrientArray: [NutrientDetailEntity?] = []
        nutrientArray.append(nutrients.ENERC_KCAL)
        nutrientArray.append(nutrients.PROCNT)
        nutrientArray.append(nutrients.FAT)
        nutrientArray.append(nutrients.FATRN)
        nutrientArray.append(nutrients.CHOCDF)
        nutrientArray.append(nutrients.CHOLE)
        nutrientArray.append(nutrients.FIBTG)
        nutrientArray.append(nutrients.RIBF)
        nutrientArray.append(nutrients.THIA)
        nutrientArray.append(nutrients.SUGAR)
        nutrientArray.append(nutrients.WATER)
        nutrientArray.append(nutrients.FAMS)
        nutrientArray.append(nutrients.FASAT)
        nutrientArray.append(nutrients.FAPU)
        nutrientArray.append(nutrients.FOLAC)
        nutrientArray.append(nutrients.FOLFD)
        nutrientArray.append(nutrients.FOLDFE)
        nutrientArray.append(nutrients.CA)
        nutrientArray.append(nutrients.ZN)
        nutrientArray.append(nutrients.FE)
        nutrientArray.append(nutrients.K)
        nutrientArray.append(nutrients.MG)
        nutrientArray.append(nutrients.NA)
        nutrientArray.append(nutrients.P)
        nutrientArray.append(nutrients.TOCPHA)
        nutrientArray.append(nutrients.VITA_RAE)
        nutrientArray.append(nutrients.VITC)
        nutrientArray.append(nutrients.VITD)
        nutrientArray.append(nutrients.VITK1)
        nutrientArray.append(nutrients.VITB6A)
        
        return nutrientArray
    }
    
    func getFavoriteFood() -> Observable<[FoodData]> {
        return foodInteractor.getFavoriteFood()
    }
    
    func addFavoriteFood(food: FoodData) -> Observable<Bool> {
        return foodInteractor.addFavoriteFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return foodInteractor.isFavorite(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return foodInteractor.removeFavoriteFood(id: id)
    }
}
