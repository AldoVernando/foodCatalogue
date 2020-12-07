//
//  FoodDetailEntity.swift
//  foodCatalogue
//
//  Created by aldo vernando on 28/11/20.
//

import Foundation

class FoodDetailEntity: Codable {
    var calories: Double?
    var totalWeight: Double?
    var healthLabels: [String]?
    var totalNutrients: TotalNutrients?
}

class TotalNutrients: Codable {
    var ENERC_KCAL: NutrientDetailEntity?
    var FAT: NutrientDetailEntity?
    var FASAT: NutrientDetailEntity?
    var FATRN: NutrientDetailEntity?
    var FAMS: NutrientDetailEntity?
    var FAPU: NutrientDetailEntity?
    var CHOCDF: NutrientDetailEntity?
    var FIBTG: NutrientDetailEntity?
    var SUGAR: NutrientDetailEntity?
    var PROCNT: NutrientDetailEntity?
    var CHOLE: NutrientDetailEntity?
    var NA: NutrientDetailEntity?
    var CA: NutrientDetailEntity?
    var MG: NutrientDetailEntity?
    var K: NutrientDetailEntity?
    var FE: NutrientDetailEntity?
    var ZN: NutrientDetailEntity?
    var P: NutrientDetailEntity?
    var VITA_RAE: NutrientDetailEntity?
    var VITC: NutrientDetailEntity?
    var THIA: NutrientDetailEntity?
    var RIBF: NutrientDetailEntity?
    var VITB6A: NutrientDetailEntity?
    var FOLDFE: NutrientDetailEntity?
    var FOLFD: NutrientDetailEntity?
    var FOLAC: NutrientDetailEntity?
    var VITD: NutrientDetailEntity?
    var TOCPHA: NutrientDetailEntity?
    var VITK1: NutrientDetailEntity?
    var WATER: NutrientDetailEntity?
}
