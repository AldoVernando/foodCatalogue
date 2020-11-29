//
//  FoodEntity.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RealmSwift

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

class FoodData: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var image: String = ""
}
