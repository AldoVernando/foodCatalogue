//
//  Endpoint.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation

class Endpoint {
    
    enum Foods: String {
        case getList = "/api/food-database/v2/parser"
        
        var url: String {
            return Constant.BASE_URL + self.rawValue
        }
    }
}
