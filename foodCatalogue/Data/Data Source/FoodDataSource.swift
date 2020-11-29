//
//  FoodDataSource.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import Alamofire

protocol FoodDataSourceProtocol {
    func getFoodList(page: Int, result: @escaping (Result<[FoodEntity], Error>) -> Void)
    func getFoodDetail(id: String, result: @escaping (Result<FoodDetailEntity, Error>) -> Void)
}

class FoodDataSource: FoodDataSourceProtocol {
    
    func getFoodList(page: Int = 0, result: @escaping (Result<[FoodEntity], Error>) -> Void) {
        
        let parameters: [String : Any] = [
            "page": page,
            "ingr": "-",
            "app_id": Constant.APP_ID,
            "app_key": Constant.API_KEY
        ]
        
        let urlParameters = Helper.generateParameter(param: parameters)
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
    
    func getFoodDetail(id: String, result: @escaping (Result<FoodDetailEntity, Error>) -> Void) {
    
        let headers: HTTPHeaders = [
            "Content-Type": Constant.APP_JSON
        ]
        
        let parameters: [String : Any] = [
            "app_id": Constant.APP_ID,
            "app_key": Constant.API_KEY
        ]
        
        let urlParameters = Helper.generateParameter(param: parameters)
        let url = "\(Endpoint.Foods.getDetail.url)?\(urlParameters)"
        
        let bodyParameters = [
            "ingredients": [
                [
                    "quantity": 1,
                    "measureURI": Constant.MEASURE_URI,
                    "foodId": id
                ]
            ]
        ]
        
        AF.request(url, method: .post, parameters: bodyParameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: FoodDetailEntity.self) { response in
            switch response.result {
            case .success(let value):
                result(.success(value))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
