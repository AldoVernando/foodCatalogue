//
//  FavoritesViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var foodList: [FoodData] = []
    private let interactor = Injection.init().provideInteractor()
    private var selectedFood: FoodData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let presenter = FoodPresenter(interactor: interactor)
        
        presenter.getFavoriteFood { result in
            switch result {
            case .success(let value):
                if value.isEmpty {
                    self.tableView.isHidden = true
                    
                    let image = UIImage(named: "placeholder")
                    let imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
                    imageView.contentMode = .scaleAspectFill
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    self.view.addSubview(imageView)
                    
                    imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
                    imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                    imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                    
                    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                    label.textAlignment = .center
                    label.text = "No favorite foods"
                    label.font = label.font.withSize(25)
                    label.textColor = #colorLiteral(red: 1, green: 0.6989139318, blue: 0.7220388651, alpha: 1)
                    label.translatesAutoresizingMaskIntoConstraints = false
                    self.view.addSubview(label)

                    label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
                    label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                } else {
                    self.foodList = value
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
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
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell {
            
            let food = foodList[indexPath.row]
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
        let food = foodList[indexPath.row]
        selectedFood = FoodData(id: food.id, name: food.name, category: food.category, image: food.image)
        
        performSegue(withIdentifier: "goToFoodDetail", sender: self)
    }
}
