//
//  FoodPresenter.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodPresenterProtocol {
    func getFoodList(page: Int) -> Observable<[FoodUIModel]>
    func getFoodDetail(id: String) -> Observable<FoodDetailUIModel>
    func getNutrients(nutrients: TotalNutrientsUIModel) -> [NutrientDetailUIModel]
    func getFavoriteFood() -> Observable<[FoodData]>
    func addFavoriteFood(food: FoodData) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodPresenter: FoodPresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    init() {
        self.foodInteractor = Injection.init().provideInteractor()
    }
    
    func getFoodList(page: Int = 0) -> Observable<[FoodUIModel]> {
        
        var foods: [FoodUIModel] = []
            
        return Observable<[FoodUIModel]>.create { observer in
            
            self.foodInteractor.getFoodList(page: page)
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    foods = result.map { food -> FoodUIModel in
                        let nutrients = food.nutrients
                        
                        return FoodUIModel(id: food.id, label: food.label, nutrients: NutrientUIModel(energy: nutrients.energy, protein: nutrients.protein, fat: nutrients.fat, carbs: nutrients.carbs, fiber: nutrients.fiber), category: food.category, categoryLabel: food.categoryLabel, image: food.image)
                    }
                } onCompleted: {
                    observer.onNext(foods)
                    observer.onCompleted()
                }
            
            return Disposables.create()
        }
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailUIModel> {
        
        var food: FoodDetailUIModel?
        
        return Observable<FoodDetailUIModel>.create { observer in
            
            self.foodInteractor.getFoodDetail(id: id)
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    
                    var totalNutrients: TotalNutrientsUIModel
                    
                    if let nutrients = result.totalNutrients {
                        totalNutrients = TotalNutrientsUIModel(
                            energy: NutrientDetailUIModel(nutrients.energy),
                            fat: NutrientDetailUIModel(nutrients.fat),
                            fasat: NutrientDetailUIModel(nutrients.fasat),
                            fatrn: NutrientDetailUIModel(nutrients.fatrn),
                            fams: NutrientDetailUIModel(nutrients.fams),
                            fapu: NutrientDetailUIModel(nutrients.fapu),
                            carbs: NutrientDetailUIModel(nutrients.carbs),
                            fiber: NutrientDetailUIModel(nutrients.fiber),
                            sugar: NutrientDetailUIModel(nutrients.sugar),
                            protein: NutrientDetailUIModel(nutrients.protein),
                            chole: NutrientDetailUIModel(nutrients.chole),
                            na: NutrientDetailUIModel(nutrients.na),
                            ca: NutrientDetailUIModel(nutrients.ca),
                            mg: NutrientDetailUIModel(nutrients.mg),
                            k: NutrientDetailUIModel(nutrients.k),
                            fe: NutrientDetailUIModel(nutrients.fe),
                            zn: NutrientDetailUIModel(nutrients.zn),
                            p: NutrientDetailUIModel(nutrients.p),
                            vita_rae: NutrientDetailUIModel(nutrients.vita_rae),
                            vitc: NutrientDetailUIModel(nutrients.vitc),
                            thia: NutrientDetailUIModel(nutrients.thia),
                            ribf: NutrientDetailUIModel(nutrients.ribf),
                            vitb64: NutrientDetailUIModel(nutrients.vitb64),
                            foldfe: NutrientDetailUIModel(nutrients.foldfe),
                            folfd: NutrientDetailUIModel(nutrients.folfd),
                            folac: NutrientDetailUIModel(nutrients.folac),
                            vitd: NutrientDetailUIModel(nutrients.vitd),
                            tocpha: NutrientDetailUIModel(nutrients.tocpha),
                            vitk1: NutrientDetailUIModel(nutrients.vitk1),
                            water: NutrientDetailUIModel(nutrients.water)
                        )
                        
                        food = FoodDetailUIModel(calories: result.calories, weight: result.weight, healthLabels: result.healthLabels, totalNutrients: totalNutrients)
                    }
                } onCompleted: {
                    if let food = food {
                        observer.onNext(food)
                        observer.onCompleted()
                    }
                }
            
            return Disposables.create()
        }
    }
    
    func getNutrients(nutrients: TotalNutrientsUIModel) -> [NutrientDetailUIModel] {
        var nutrientArray: [NutrientDetailUIModel] = []
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
