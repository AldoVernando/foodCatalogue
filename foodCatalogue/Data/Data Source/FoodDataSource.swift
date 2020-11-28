//
//  FoodDataSource.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import Alamofire

class FoodDataSource: FoodDataSourceProtocol {
    
    func getFoodList(page: Int = 0, result: @escaping (Result<[FoodEntity], Error>) -> Void) {
        
        let parameters = [
            "page": page,
            "ingr": "-",
            "app_id": Constant.APP_ID,
            "app_key": Constant.API_KEY
        ] as [String : Any]
        
        let urlParameters = (parameters.compactMap { (key, value) -> String in
            return "\(key)=\(value)"
        } as Array).joined(separator: "&")
        
        let url = "\(Endpoint.Foods.getList.url)?\(urlParameters)"
        
        AF.request(url, method: .get).responseDecodable(of: FoodListEntity.self) { response in
            switch response.result {
            case .success(let value):
                result(.success(value.hints))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
