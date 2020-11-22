//
//  FoodsViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit

class FoodsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodDataSource.init().getFoodList { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
