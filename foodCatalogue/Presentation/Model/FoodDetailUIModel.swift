//
//  FoodDetailUIModel.swift
//  foodCatalogue
//
//  Created by aldo vernando on 07/12/20.
//

import Foundation

class FoodDetailUIModel {
    var calories: Double
    var weight: Double
    var healthLabels: [String]
    var totalNutrients: TotalNutrientsUIModel
    
    init(calories: Double, weight: Double, healthLabels: [String], totalNutrients: TotalNutrientsUIModel) {
        self.calories = calories
        self.weight = weight
        self.healthLabels = healthLabels
        self.totalNutrients = totalNutrients
    }
}

class TotalNutrientsUIModel {
    var energy: NutrientDetailUIModel
    var fat: NutrientDetailUIModel
    var fasat: NutrientDetailUIModel
    var fatrn: NutrientDetailUIModel
    var fams: NutrientDetailUIModel
    var fapu: NutrientDetailUIModel
    var carbs: NutrientDetailUIModel
    var fiber: NutrientDetailUIModel
    var sugar: NutrientDetailUIModel
    var protein: NutrientDetailUIModel
    var chole: NutrientDetailUIModel
    var na: NutrientDetailUIModel
    var ca: NutrientDetailUIModel
    var mg: NutrientDetailUIModel
    var k: NutrientDetailUIModel
    var fe: NutrientDetailUIModel
    var zn: NutrientDetailUIModel
    var p: NutrientDetailUIModel
    var vita_rae: NutrientDetailUIModel
    var vitc: NutrientDetailUIModel
    var thia: NutrientDetailUIModel
    var ribf: NutrientDetailUIModel
    var vitb64: NutrientDetailUIModel
    var foldfe: NutrientDetailUIModel
    var folfd: NutrientDetailUIModel
    var folac: NutrientDetailUIModel
    var vitd: NutrientDetailUIModel
    var tocpha: NutrientDetailUIModel
    var vitk1: NutrientDetailUIModel
    var water: NutrientDetailUIModel
    
    init(energy: NutrientDetailUIModel, fat: NutrientDetailUIModel, fasat: NutrientDetailUIModel, fatrn: NutrientDetailUIModel, fams: NutrientDetailUIModel, fapu: NutrientDetailUIModel, carbs: NutrientDetailUIModel, fiber: NutrientDetailUIModel, sugar: NutrientDetailUIModel, protein: NutrientDetailUIModel, chole: NutrientDetailUIModel, na: NutrientDetailUIModel, ca: NutrientDetailUIModel, mg: NutrientDetailUIModel, k: NutrientDetailUIModel, fe: NutrientDetailUIModel, zn: NutrientDetailUIModel, p: NutrientDetailUIModel, vita_rae: NutrientDetailUIModel, vitc: NutrientDetailUIModel, thia: NutrientDetailUIModel, ribf: NutrientDetailUIModel, vitb64: NutrientDetailUIModel, foldfe: NutrientDetailUIModel, folfd: NutrientDetailUIModel, folac: NutrientDetailUIModel, vitd: NutrientDetailUIModel, tocpha: NutrientDetailUIModel, vitk1: NutrientDetailUIModel, water: NutrientDetailUIModel) {
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
