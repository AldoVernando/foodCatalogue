//
//  Router.swift
//  foodCatalogue
//
//  Created by aldo vernando on 09/12/20.
//

import UIKit
import FoodCatalogueModule
import FoodDetailModule

protocol RouterProtocol {
    func navigateToFoodDetailScene(food: FoodModel, sender: UIViewController)
}

class Router: RouterProtocol {
    
    func navigateToFoodDetailScene(food: FoodModel, sender: UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "foodDetailViewController") as! FoodDetailViewController
        vc.modalPresentationStyle = .fullScreen
        vc.foodData = food
        vc.presenter = FoodDetailPresenter()
        let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        navController?.pushViewController(vc, animated: true)
    }
}
