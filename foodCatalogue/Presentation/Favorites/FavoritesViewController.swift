//
//  FavoritesViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit
import RxSwift

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var placeholder: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    private var foods: [FoodData] = []
    private let interactor = Injection.init().provideInteractor()
    private var selectedFood: FoodData?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let presenter = FoodPresenter(interactor: interactor)
        
        presenter.getFavoriteFood()
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                    self.foods = result
                    self.tableView.reloadData()
            } onCompleted: {
                if self.foods.isEmpty {
                    self.tableView.isHidden = true
                } else {
                    self.tableView.isHidden = false
                }
            }.disposed(by: disposeBag)
    }
}


// MARK: Segue
extension FavoritesViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFoodDetail" {
            if let vc = segue.destination as? FoodDetailViewController {
                vc.foodData = selectedFood
            }
        }
    }
}


// MARK: UITableView
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell {
            
            let food = foods[indexPath.row]
            cell.foodImage.sd_setImage(with: URL(string: food.image), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .continueInBackground)
            cell.title.text = food.name
            cell.category.text = food.category
//            cell.calories.text = String(food.nutrients.ENERC_KCAL ?? 0) + " KCal"
//            cell.protein.text = String(food.nutrients.PROCNT ?? 0) + " mg"
//            cell.fat.text = String(food.nutrients.FAT ?? 0) + " mg"
//            cell.carbs.text = String(food.nutrients.CHOCDF ?? 0) + " mg"
//            cell.fiber.text = String(food.nutrients.FIBTG ?? 0) + " mg"
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foods[indexPath.row]
        selectedFood = FoodData(id: food.id, name: food.name, category: food.category, image: food.image)
        
        performSegue(withIdentifier: "goToFoodDetail", sender: self)
    }
}
