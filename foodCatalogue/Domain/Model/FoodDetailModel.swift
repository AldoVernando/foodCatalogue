//
//  FoodDetailModel.swift
//  foodCatalogue
//
//  Created by aldo vernando on 07/12/20.
//

import Foundation

class FoodDetailModel {
    var calories: Double
    var weight: Double
    var healthLabels: [String]
    var totalNutrients: TotalNutrientsModel?
    
    init(calories: Double, weight: Double, healthLabels: [String], totalNutrients: TotalNutrientsModel?) {
        self.calories = calories
        self.weight = weight
        self.healthLabels = healthLabels
        self.totalNutrients = totalNutrients
    }
}

class TotalNutrientsModel {
    var energy: NutrientDetailModel
    var fat: NutrientDetailModel
    var fasat: NutrientDetailModel
    var fatrn: NutrientDetailModel
    var fams: NutrientDetailModel
    var fapu: NutrientDetailModel
    var carbs: NutrientDetailModel
    var fiber: NutrientDetailModel
    var sugar: NutrientDetailModel
    var protein: NutrientDetailModel
    var chole: NutrientDetailModel
    var na: NutrientDetailModel
    var ca: NutrientDetailModel
    var mg: NutrientDetailModel
    var k: NutrientDetailModel
    var fe: NutrientDetailModel
    var zn: NutrientDetailModel
    var p: NutrientDetailModel
    var vita_rae: NutrientDetailModel
    var vitc: NutrientDetailModel
    var thia: NutrientDetailModel
    var ribf: NutrientDetailModel
    var vitb64: NutrientDetailModel
    var foldfe: NutrientDetailModel
    var folfd: NutrientDetailModel
    var folac: NutrientDetailModel
    var vitd: NutrientDetailModel
    var tocpha: NutrientDetailModel
    var vitk1: NutrientDetailModel
    var water: NutrientDetailModel
    
    init(energy: NutrientDetailModel, fat: NutrientDetailModel, fasat: NutrientDetailModel, fatrn: NutrientDetailModel, fams: NutrientDetailModel, fapu: NutrientDetailModel, carbs: NutrientDetailModel, fiber: NutrientDetailModel, sugar: NutrientDetailModel, protein: NutrientDetailModel, chole: NutrientDetailModel, na: NutrientDetailModel, ca: NutrientDetailModel, mg: NutrientDetailModel, k: NutrientDetailModel, fe: NutrientDetailModel, zn: NutrientDetailModel, p: NutrientDetailModel, vita_rae: NutrientDetailModel, vitc: NutrientDetailModel, thia: NutrientDetailModel, ribf: NutrientDetailModel, vitb64: NutrientDetailModel, foldfe: NutrientDetailModel, folfd: NutrientDetailModel, folac: NutrientDetailModel, vitd: NutrientDetailModel, tocpha: NutrientDetailModel, vitk1: NutrientDetailModel, water: NutrientDetailModel) {
        self.energy = energy
        self.fat = fat
        self.fasat = fasat
        self.fatrn = fatrn
        self.fams = fams
        self.fapu = fapu
        self.carbs = carbs
        self.fiber = fiber
        self.sugar = sugar
        self.protein = protein
        self.chole = chole
        self.na = na
        self.ca = ca
        self.mg = mg
        self.k = k
        self.fe = fe
        self.zn = zn
        self.p = p
        self.vita_rae = vita_rae
        self.vitc = vitc
        self.thia = thia
        self.ribf = ribf
        self.vitb64 = vitb64
        self.foldfe = foldfe
        self.folfd = folfd
        self.folac = folac
        self.vitd = vitd
        self.tocpha = tocpha
        self.vitk1 = vitk1
        self.water = water
    }
}
