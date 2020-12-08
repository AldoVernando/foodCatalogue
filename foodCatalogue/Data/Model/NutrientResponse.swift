//
//  NutrientResponse.swift
//  foodCatalogue
//
//  Created by aldo vernando on 08/12/20.
//

import Foundation

class NutrientResponse: Codable {
    var ENERC_KCAL: Double?
    var PROCNT: Double?
    var FAT: Double?
    var CHOCDF: Double?
    var FIBTG: Double?
}

class NutrientDetailResponse: Codable {
    var label: String?
    var quantity: Double?
    var unit: String?
}
