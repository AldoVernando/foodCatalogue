//
//  FoodPresenter.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

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
}
