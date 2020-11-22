//
//  FoodEntity.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

class FoodEntity: Codable {
    var food: Food
}

class Food: Codable {
    var foodId: String?
    var label: String?
    var nutrients: NutrientEntity
    var category: String?
    var categoryLabel: String?
    var image: String?
}
