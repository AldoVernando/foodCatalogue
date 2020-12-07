//
//  RemoteDataSource.swift
//  foodCatalogue
//
//  Created by aldo vernando on 22/11/20.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol {
    func getFoodList(page: Int) -> Observable<[FoodResult]>
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity>
}

class RemoteDataSource: RemoteDataSourceProtocol {
    
    func getFoodList(page: Int = 0) -> Observable<[FoodResult]> {
        
        let parameters: [String : Any] = [
            "page": page,
            "ingr": "-",
            "app_id": Constant.APP_ID,
            "app_key": Constant.API_KEY
        ]
        
        let urlParameters = Helper.generateParameter(param: parameters)
        let url = "\(Endpoint.Foods.getList.url)?\(urlParameters)"
        
        return Observable<[FoodResult]>.create { observer in
        
            AF.request(url, method: .get).responseDecodable(of: FoodListEntity.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value.hints)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func getFoodDetail(id: String) -> Observable<FoodDetailEntity> {
    
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
        
        return Observable<FoodDetailEntity>.create { observer in
        
            AF.request(url, method: .post, parameters: bodyParameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: FoodDetailEntity.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
