//
//  NutrientModel.swift
//  foodCatalogue
//
//  Created by aldo vernando on 07/12/20.
//

import Foundation

class NutrientModel {
    var energy: Double
    var protein: Double
    var fat: Double
    var carbs: Double
    var fiber: Double
    
    init(energy: Double, protein: Double, fat: Double, carbs: Double, fiber: Double) {
        self.energy = energy
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
        self.fiber = fiber
    }
}

class NutrientDetailModel {
    var label: String
    var quantity: Double
    var unit: String
    
    init(_ entity: NutrientDetailResponse?) {
        self.label = entity?.label ?? ""
        self.quantity = entity?.quantity ?? 0
        self.unit = entity?.unit ?? ""
    }
}
