//
//  NutrientEntity.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

class NutrientEntity: Codable {
    var ENERC_KCAL: Double?
    var PROCNT: Double?
    var FAT: Double?
    var CHOCDF: Double?
    var FIBTG: Double?
}

class NutrientDetailEntity: Codable {
    var label: String?
    var quantity: Double?
    var unit: String?
}
