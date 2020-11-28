//
//  FoodRepositoryProtocol.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

protocol FoodRepositoryProtocol {
    func getFoodList(page: Int, completion: @escaping (Result<[FoodEntity], Error>) -> Void)
    func getFoodDetail(id: String, completion: @escaping (Result<FoodDetailEntity, Error>) -> Void)
}
