//
//  FoodsViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit
import SDWebImage

class FoodsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var foodList: [FoodEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCell")
        
        let interactor = Injection.init().provideInteractor()
        let presenter = FoodPresenter(interactor: interactor)
        
        presenter.getFoodList { result in
            switch result {
            case .success(let value):
                self.foodList.append(contentsOf: value)
                self.tableView.reloadData()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}


// MARK: UITableView
extension FoodsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell {
            
            let food = foodList[indexPath.row].food
            cell.foodImage.sd_setImage(with: URL(string: food.image ?? ""), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .continueInBackground)
            cell.title.text = food.label
            cell.category.text = food.category
            cell.calories.text = String(food.nutrients.ENERC_KCAL ?? 0) + " KCal"
            cell.protein.text = String(food.nutrients.PROCNT ?? 0) + " mg"
            cell.fat.text = String(food.nutrients.FAT ?? 0) + " mg"
            cell.carbs.text = String(food.nutrients.CHOCDF ?? 0) + " mg"
            cell.fiber.text = String(food.nutrients.FIBTG ?? 0) + " mg"
            
            return cell
        }
        return UITableViewCell()
    }
}
