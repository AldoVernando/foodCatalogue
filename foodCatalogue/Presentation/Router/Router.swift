//
//  Router.swift
//  foodCatalogue
//
//  Created by aldo vernando on 09/12/20.
//

import UIKit

protocol RouterProtocol {
    func navigateToFoodDetailScene(food: FoodEntity, sender: UIViewController)
}

class Router: RouterProtocol {
    
    func navigateToFoodDetailScene(food: FoodEntity, sender: UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "foodDetailViewController") as! FoodDetailViewController
        vc.modalPresentationStyle = .fullScreen
        vc.foodData = food
        vc.presenter = FoodPresenter()
        let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        navController?.pushViewController(vc, animated: true)
    }
}
