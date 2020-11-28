//
//  FoodDataSourceProtocol.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

protocol FoodDataSourceProtocol {
    func getFoodList(page: Int, result: @escaping (Result<[FoodEntity], Error>) -> Void)
}
