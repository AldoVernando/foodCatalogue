//
//  FoodsViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit

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
            cell.title.text = food.label
            return cell
        }
        return UITableViewCell()
    }
}
