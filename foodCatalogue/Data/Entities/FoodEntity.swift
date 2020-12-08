//
//  FoodEntity.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import RealmSwift

class FoodEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var image: String = ""
    
    convenience init(id: String, name: String, category: String, image: String) {
        self.init()
        self.id = id
        self.name = name
        self.category = category
        self.image = image
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
