//
//  FoodUseCase.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

protocol FoodUseCase {
    func getFoodList(completion: @escaping (Result<[FoodEntity], Error>) -> Void)
}
