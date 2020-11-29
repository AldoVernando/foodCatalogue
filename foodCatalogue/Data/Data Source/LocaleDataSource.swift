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
    func isFoodExists(id: String) -> Bool
    func removeFood(id: String, result: @escaping (Result<Bool, Error>) -> Void)
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
            let foods = realm.objects(FoodData.self).sorted(byKeyPath: "name", ascending: true)
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
    
    func isFoodExists(id: String) -> Bool {
        if let realm = realm {
            return realm.object(ofType: FoodData.self, forPrimaryKey: id) != nil
        }
        return false
    }
    
    func removeFood(id: String, result: @escaping (Result<Bool, Error>) -> Void) {
        if let realm = realm {
            do {
                try realm.write {
                    if let object = realm.object(ofType: FoodData.self, forPrimaryKey: id) {
                        realm.delete(object)
                        result(.success(true))
                    }
                }
            } catch let error {
                result(.failure(error))
            }
        }
    }
}
