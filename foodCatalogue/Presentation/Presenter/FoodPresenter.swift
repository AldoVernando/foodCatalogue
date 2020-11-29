//
//  FoodPresenter.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

protocol FoodPresenterProtocol {
    func getFoodList(page: Int, completion: @escaping (Result<[FoodEntity], Error>) -> Void)
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void)
    func getNutrients(nutrients: TotalNutrients) -> [NutrientDetailEntity?]
    func getFavoriteFood(completion: @escaping (Result<[FoodData], Error>) -> Void)
    func addFavoriteFood(food: FoodData, completion: @escaping (Result<Bool, Error>) -> Void)
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

class FoodPresenter: FoodPresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    init(interactor: FoodUseCase) {
        self.foodInteractor = interactor
    }
    
    func getFoodList(page: Int = 0, completion: @escaping (Result<[FoodEntity], Error>) -> Void) {
        foodInteractor.getFoodList(page: page) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void) {
        foodInteractor.getFoodDetail(id: id) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
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
    
    func getFavoriteFood(completion: @escaping (Result<[FoodData], Error>) -> Void) {
        foodInteractor.getFavoriteFood { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addFavoriteFood(food: FoodData, completion: @escaping (Result<Bool, Error>) -> Void) {
        foodInteractor.addFavoriteFood(food: food) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func isFavorite(id: String) -> Bool {
        return foodInteractor.isFavorite(id: id)
    }
    
    func removeFavoriteFood(id: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        foodInteractor.removeFavoriteFood(id: id) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
