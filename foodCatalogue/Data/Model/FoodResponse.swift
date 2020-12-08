//
//  FoodResponse.swift
//  foodCatalogue
//
//  Created by aldo vernando on 08/12/20.
//

import Foundation

class FoodListResponse: Codable {
    var hints: [FoodResultResponse]
}

class FoodResultResponse: Codable {
    var food: FoodResponse
}

class FoodResponse: Codable {
    var foodId: String?
    var label: String?
    var nutrients: NutrientResponse
    var category: String?
    var categoryLabel: String?
    var image: String?
}
