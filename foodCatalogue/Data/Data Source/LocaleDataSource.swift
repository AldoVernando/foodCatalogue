//
//  LocaleDataSource.swift
//  foodCatalogue
//
//  Created by aldo vernando on 29/11/20.
//

import Foundation
import RealmSwift

protocol LocaleDataSourceProtocol {
    func getFoods(result: @escaping (Result<[FoodData], Error>) -> Void)
    func addFood(food: FoodData, result: @escaping (Result<Bool, Error>) -> Void)
}

class LocaleDataSource: NSObject {
    
    let realm: Realm?
    init(realm: Realm?) {
        self.realm = realm
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getFoods(result: @escaping (Result<[FoodData], Error>) -> Void) {
        if let realm = realm {
            let foods = realm.objects(FoodData.self).sorted(byKeyPath: "label", ascending: true)
            result(.success(Array(foods)))
        }
    }
    
    func addFood(food: FoodData, result: @escaping (Result<Bool, Error>) -> Void) {
        if let realm = realm {
            do {
                try realm.write {
                    realm.add(food, update: .all)
                    result(.success(true))
                }
            } catch let error {
                result(.failure(error))
            }
        }
    }
}
