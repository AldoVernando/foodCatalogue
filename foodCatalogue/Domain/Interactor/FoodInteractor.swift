//
//  FoodInteractor.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

protocol FoodUseCase {
    func getFoodList(page: Int, completion: @escaping (Result<[FoodEntity], Error>) -> Void)
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void)
    func getFavoriteFood(completion: @escaping (Result<[FoodData], Error>) -> Void)
    func addFavoriteFood(food: FoodData, completion: @escaping (Result<Bool, Error>) -> Void)
}

class FoodInteractor: FoodUseCase {
    
    private let foodRepository: FoodRepositoryProtocol
    
    init(repository: FoodRepositoryProtocol) {
        self.foodRepository = repository
    }
    
    func getFoodList(page: Int = 0, completion: @escaping (Result<[FoodEntity], Error>) -> Void) {
        foodRepository.getFoodList(page: page) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void) {
        foodRepository.getFoodDetail(id: id) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFavoriteFood(completion: @escaping (Result<[FoodData], Error>) -> Void) {
        foodRepository.getFavoriteFood { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addFavoriteFood(food: FoodData, completion: @escaping (Result<Bool, Error>) -> Void) {
        foodRepository.addFavoriteFood(food: food) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
