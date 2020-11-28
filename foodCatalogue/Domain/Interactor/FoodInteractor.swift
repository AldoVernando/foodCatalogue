//
//  FoodInteractor.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

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
}
