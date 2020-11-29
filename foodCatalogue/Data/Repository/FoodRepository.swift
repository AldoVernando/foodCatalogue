//
//  FoodRepository.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

protocol FoodRepositoryProtocol {
    func getFoodList(page: Int, completion: @escaping (Result<[FoodEntity], Error>) -> Void)
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void)
    func getFavoriteFood(completion: @escaping (Result<[FoodData], Error>) -> Void)
    func addFavoriteFood(food: FoodData, completion: @escaping (Result<Bool, Error>) -> Void)
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

class FoodRepository: FoodRepositoryProtocol {
    
    private let remote: FoodDataSourceProtocol
    private let locale: LocaleDataSourceProtocol
    
    init(remote: FoodDataSourceProtocol, locale: LocaleDataSourceProtocol) {
        self.remote = remote
        self.locale = locale
    }
    
    func getFoodList(page: Int = 0, completion: @escaping (Result<[FoodEntity], Error>) -> Void) {
        remote.getFoodList(page: page) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void) {
        remote.getFoodDetail(id: id) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFavoriteFood(completion: @escaping (Result<[FoodData], Error>) -> Void) {
        locale.getFoods { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addFavoriteFood(food: FoodData, completion: @escaping (Result<Bool, Error>) -> Void) {
        locale.addFood(food: food) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func isFavorite(id: String) -> Bool {
        return locale.isFoodExists(id: id)
    }
    
    func removeFavoriteFood(id: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        locale.removeFood(id: id) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
