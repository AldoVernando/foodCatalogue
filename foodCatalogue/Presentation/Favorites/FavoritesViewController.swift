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
    private var foods: [FoodModel] = []
    private var selectedFood: FoodModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let presenter = FoodPresenter()
        
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
            cell.title.text = food.label
            cell.category.text = food.category
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foods[indexPath.row]
        selectedFood = FoodModel(id: food.id, label: food.label, nutrients: food.nutrients, category: food.category, categoryLabel: food.categoryLabel, image: food.image)
        performSegue(withIdentifier: "goToFoodDetail", sender: self)
    }
}
