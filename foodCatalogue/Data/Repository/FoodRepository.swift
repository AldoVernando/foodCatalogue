//
//  FoodRepository.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

class FoodRepository: FoodRepositoryProtocol {
    
    private let foodDataSource: FoodDataSourceProtocol
    
    init(dataSource: FoodDataSourceProtocol) {
        self.foodDataSource = dataSource
    }
    
    func getFoodList(page: Int = 0, completion: @escaping (Result<[FoodEntity], Error>) -> Void) {
        foodDataSource.getFoodList(page: page) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void) {
        foodDataSource.getFoodDetail(id: id) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
