//
//  FoodsViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit
import SDWebImage
import RxSwift

class FoodsViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    private let interactor = Injection.init().provideInteractor()
    private var page: Int = 0
    private var selectedFood: FoodData?
    private var presenter: FoodPresenter?
    private let disposeBag = DisposeBag()
    private var foods: [FoodEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FoodPresenter(interactor: interactor)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCell")
        
        guard let presenter = presenter else { return }
        
        presenter.getFoodList()
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                self.foods = result
                self.tableView.reloadData()
            } onError: { error in
                print("Error \(error.localizedDescription)")
            } onCompleted: {
                self.activityIndicator.stopAnimating()
                self.tableView.isHidden = false
            }.disposed(by: disposeBag)
    }
}


// MARK: Segue
extension FoodsViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFoodDetail" {
            if let vc = segue.destination as? FoodDetailViewController {
                vc.foodData = selectedFood
            }
        }
    }
}


// MARK: UITableView
extension FoodsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell {
            
            let food = self.foods[indexPath.row].food
            cell.foodImage.sd_setImage(with: URL(string: food.image ?? ""), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .continueInBackground)
            cell.title.text = food.label
            cell.category.text = food.category
            cell.calories.text = String(food.nutrients.ENERC_KCAL ?? 0) + " KCal"
            cell.protein.text = String(food.nutrients.PROCNT ?? 0) + " mg"
            cell.fat.text = String(food.nutrients.FAT ?? 0) + " mg"
            cell.carbs.text = String(food.nutrients.CHOCDF ?? 0) + " mg"
            cell.fiber.text = String(food.nutrients.FIBTG ?? 0) + " mg"
            cell.selectionStyle = .none
            
            // pagination
            if indexPath.row == self.foods.count - 1 {
                page += 1
                
                guard let presenter = presenter else { return cell }
                
                presenter.getFoodList(page: page)
                    .observeOn(MainScheduler.instance)
                    .subscribe { result in
                        self.foods.append(contentsOf: result)
                        self.tableView.reloadData()
                    } onError: { error in
                        print("Error \(error.localizedDescription)")
                    }.disposed(by: disposeBag)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = self.foods[indexPath.row].food
        selectedFood = FoodData(id: food.foodId ?? "", name: food.label ?? "", category: food.category ?? "", image: food.image ?? "")
        
        performSegue(withIdentifier: "goToFoodDetail", sender: self)
    }
}
