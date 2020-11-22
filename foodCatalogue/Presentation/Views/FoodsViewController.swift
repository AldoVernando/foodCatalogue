//
//  FoodsViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit

class FoodsViewController: UIViewController {
    
    
    private var foodList: [FoodEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = Injection.init().provideInteractor()
        let presenter = FoodPresenter(interactor: interactor)
        
        presenter.getFoodList { result in
            switch result {
            case .success(let value):
                self.foodList.append(contentsOf: value)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
