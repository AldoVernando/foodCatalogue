//
//  FoodDetailResponse.swift
//  foodCatalogue
//
//  Created by aldo vernando on 08/12/20.
//

import Foundation

class FoodDetailResponse: Codable {
    var calories: Double?
    var totalWeight: Double?
    var healthLabels: [String]?
    var totalNutrients: TotalNutrients?
}

class TotalNutrients: Codable {
    var ENERC_KCAL: NutrientDetailResponse?
    var FAT: NutrientDetailResponse?
    var FASAT: NutrientDetailResponse?
    var FATRN: NutrientDetailResponse?
    var FAMS: NutrientDetailResponse?
    var FAPU: NutrientDetailResponse?
    var CHOCDF: NutrientDetailResponse?
    var FIBTG: NutrientDetailResponse?
    var SUGAR: NutrientDetailResponse?
    var PROCNT: NutrientDetailResponse?
    var CHOLE: NutrientDetailResponse?
    var NA: NutrientDetailResponse?
    var CA: NutrientDetailResponse?
    var MG: NutrientDetailResponse?
    var K: NutrientDetailResponse?
    var FE: NutrientDetailResponse?
    var ZN: NutrientDetailResponse?
    var P: NutrientDetailResponse?
    var VITA_RAE: NutrientDetailResponse?
    var VITC: NutrientDetailResponse?
    var THIA: NutrientDetailResponse?
    var RIBF: NutrientDetailResponse?
    var VITB6A: NutrientDetailResponse?
    var FOLDFE: NutrientDetailResponse?
    var FOLFD: NutrientDetailResponse?
    var FOLAC: NutrientDetailResponse?
    var VITD: NutrientDetailResponse?
    var TOCPHA: NutrientDetailResponse?
    var VITK1: NutrientDetailResponse?
    var WATER: NutrientDetailResponse?
}
