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
    
    func getFoodList(completion: @escaping (Result<[FoodEntity], Error>) -> Void) {
        foodRepository.getFoodList { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
