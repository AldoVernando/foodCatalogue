//
//  FoodUIModel.swift
//  foodCatalogue
//
//  Created by aldo vernando on 07/12/20.
//

import Foundation

class FoodUIModel {
    var id: String
    var label: String
    var nutrients: NutrientUIModel
    var category: String
    var categoryLabel: String
    var image: String
    
    init(id: String, label: String, nutrients: NutrientUIModel, category: String, categoryLabel: String, image: String) {
        self.id = id
        self.label = label
        self.nutrients = nutrients
        self.category = category
        self.categoryLabel = categoryLabel
        self.image = image
    }
}