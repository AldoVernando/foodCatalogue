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
    
    func getFoodList(completion: @escaping (Result<[FoodEntity], Error>) -> Void) {
        foodInteractor.getFoodList { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}