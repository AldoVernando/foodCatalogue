//
//  FoodRepository.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RxSwift

protocol FoodRepositoryProtocol {
    func getFoodList(page: Int) -> Observable<[FoodModel]>
    func getFoodDetail(id: String) -> Observable<FoodDetailModel>
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
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
    
    func getFoodList(page: Int = 0) -> Observable<[FoodModel]> {
        
        var foods: [FoodModel] = []
            
        return Observable<[FoodModel]>.create { observer in
            
            self.remote.getFoodList(page: page)
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    foods = result.map { foodResult -> FoodModel in
                        let food = foodResult.food
                        let nutrients = food.nutrients
                        
                        return FoodModel(id: food.foodId ?? "", label: food.label ?? "", nutrients: NutrientModel(energy: nutrients.ENERC_KCAL ?? 0, protein: nutrients.PROCNT ?? 0, fat: nutrients.FAT ?? 0, carbs: nutrients.CHOCDF ?? 0, fiber: nutrients.FIBTG ?? 0), category: food.category ?? "", categoryLabel: food.categoryLabel ?? "", image: food.image ?? "")
                    }
                } onCompleted: {
                    observer.onNext(foods)
                    observer.onCompleted()
                }
            
            return Disposables.create()
        }
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailModel> {
        
        var food: FoodDetailModel?
        
        return Observable<FoodDetailModel>.create { observer in
            
            self.remote.getFoodDetail(id: id)
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    
                    var totalNutrients: TotalNutrientsModel?
                    
                    if let nutrients = result.totalNutrients {
                        totalNutrients = TotalNutrientsModel(
                            energy: NutrientDetailModel(nutrients.ENERC_KCAL),
                            fat: NutrientDetailModel(nutrients.FAT),
                            fasat: NutrientDetailModel(nutrients.FASAT),
                            fatrn: NutrientDetailModel(nutrients.FATRN),
                            fams: NutrientDetailModel(nutrients.FAMS),
                            fapu: NutrientDetailModel(nutrients.FAPU),
                            carbs: NutrientDetailModel(nutrients.CHOCDF),
                            fiber: NutrientDetailModel(nutrients.FIBTG),
                            sugar: NutrientDetailModel(nutrients.SUGAR),
                            protein: NutrientDetailModel(nutrients.PROCNT),
                            chole: NutrientDetailModel(nutrients.CHOLE),
                            na: NutrientDetailModel(nutrients.NA),
                            ca: NutrientDetailModel(nutrients.CA),
                            mg: NutrientDetailModel(nutrients.MG),
                            k: NutrientDetailModel(nutrients.K),
                            fe: NutrientDetailModel(nutrients.FE),
                            zn: NutrientDetailModel(nutrients.ZN),
                            p: NutrientDetailModel(nutrients.P),
                            vita_rae: NutrientDetailModel(nutrients.VITA_RAE),
                            vitc: NutrientDetailModel(nutrients.VITC),
                            thia: NutrientDetailModel(nutrients.THIA),
                            ribf: NutrientDetailModel(nutrients.RIBF),
                            vitb64: NutrientDetailModel(nutrients.VITB6A),
                            foldfe: NutrientDetailModel(nutrients.FOLDFE),
                            folfd: NutrientDetailModel(nutrients.FOLFD),
                            folac: NutrientDetailModel(nutrients.FOLAC),
                            vitd: NutrientDetailModel(nutrients.VITD),
                            tocpha: NutrientDetailModel(nutrients.TOCPHA),
                            vitk1: NutrientDetailModel(nutrients.VITK1),
                            water: NutrientDetailModel(nutrients.WATER)
                        )
                    }
                    
                    food = FoodDetailModel(calories: result.calories ?? 0, weight: result.totalWeight ?? 0, healthLabels: result.healthLabels ?? [], totalNutrients: totalNutrients)
                } onCompleted: {
                    if let food = food {
                        observer.onNext(food)
                        observer.onCompleted()
                    }
                }
            
            return Disposables.create()
        }
    }
    
    func getFavoriteFood() -> Observable<[FoodModel]> {
        
        var foods: [FoodModel] = []
            
        return Observable<[FoodModel]>.create { observer in
            
            self.locale.getFoods()
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    foods = result.map { food -> FoodModel in
                        
                        return FoodModel(id: food.id, label: food.name, nutrients: nil, category: food.category, categoryLabel: nil, image: food.image ?? "")
                    }
                } onCompleted: {
                    observer.onNext(foods)
                    observer.onCompleted()
                }
            
            return Disposables.create()
        }
    }
    
    func addFavoriteFood(food: FoodModel) -> Observable<Bool> {
        let food = FoodEntity(id: food.id, name: food.label, category: food.category ?? "", image: food.image)
        return locale.addFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return locale.isFoodExists(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return locale.removeFood(id: id)
    }
}
