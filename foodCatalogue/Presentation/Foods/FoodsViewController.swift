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
    @IBOutlet weak var searchField: UITextField!
    private var page: Int = 0
    private var presenter: FoodPresenter?
    private let disposeBag = DisposeBag()
    private var foods: [FoodModel] = []
    private let router: Router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FoodPresenter()
        
        searchField.leftViewMode = .always
        let searchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.image = UIImage(systemName: "magnifyingglass")
        searchImageView.tintColor = .black
        searchField.leftView = searchImageView
        searchField.delegate = self
        
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


// MARK: UITableView
extension FoodsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell {
            
            let food = self.foods[indexPath.row]
            cell.foodImage.sd_setImage(with: URL(string: food.image), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .continueInBackground)
            cell.title.text = food.label
            cell.category.text = food.category
            cell.calories.text = String(food.nutrients?.energy ?? 0) + " KCal"
            cell.protein.text = String(food.nutrients?.protein ?? 0) + " mg"
            cell.fat.text = String(food.nutrients?.fat ?? 0) + " mg"
            cell.carbs.text = String(food.nutrients?.carbs ?? 0) + " mg"
            cell.fiber.text = String(food.nutrients?.fiber ?? 0) + " mg"
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
        let food = self.foods[indexPath.row]
        let selectedFood = FoodModel(id: food.id, label: food.label, nutrients: food.nutrients , category: food.category, categoryLabel: food.categoryLabel, image: food.image)
        router.navigateToFoodDetailScene(food: selectedFood, sender: self)
    }
}


// MARK: UITextField
extension FoodsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let presenter = presenter else { return false }
        
        presenter.getFoodList(keyword: textField.text ?? "-")
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
        
        return true
    }
}
