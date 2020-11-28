//
//  Helper.swift
//  foodCatalogue
//
//  Created by aldo vernando on 28/11/20.
//

import Foundation

class Helper {
    
    static func generateParameter(param: [String: Any]) -> String {
        return (param.compactMap { (key, value) -> String in
            return "\(key)=\(value)"
        } as Array).joined(separator: "&")
    }
}
