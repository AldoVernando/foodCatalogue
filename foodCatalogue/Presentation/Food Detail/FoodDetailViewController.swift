//
//  FoodDetailViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 29/11/20.
//

import UIKit
import RxSwift

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var healthText: UILabel!
    @IBOutlet weak var healthLabels: UILabel!
    @IBOutlet weak var nutrientsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    private let interactor = Injection.init().provideInteractor()
    private var nutrients: [NutrientDetailUIModel] = []
    private var isFavorite: Bool = false {
        didSet {
            if isFavorite {
                favoriteButton.image = UIImage(systemName: "star.fill")
            } else {
                favoriteButton.image = UIImage(systemName: "star")
            }
        }
    }
    var foodData: FoodData?
    private var presenter: FoodPresenter?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FoodPresenter(interactor: interactor)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NutrientTableViewCell", bundle: nil), forCellReuseIdentifier: "nutrientCell")
        
        guard let presenter = presenter else { return }
        
        if let food = foodData {
            foodName.text = food.name
            foodImage.sd_setImage(with: URL(string: food.image), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .continueInBackground)
            
            presenter.getFoodDetail(id: food.id)
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    self.healthLabels.text = result.healthLabels.joined(separator: ", ")
                    self.nutrients = self.presenter?.getNutrients(nutrients: result.totalNutrients) ?? []
                    self.nutrients.removeAll { $0.label == "" }
                    self.tableView.reloadData()
                } onError: { error in
                    print("Error \(error.localizedDescription)")
                } onCompleted: {
                    self.activityIndicator.stopAnimating()
                    if self.nutrients.isEmpty {
                        self.tableView.isHidden = true
                        
                        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                        label.center = CGPoint(x: 160, y: 285)
                        label.textAlignment = .center
                        label.text = "No nutrients data"
                        label.textColor = #colorLiteral(red: 1, green: 0.6989139318, blue: 0.7220388651, alpha: 1)
                        label.translatesAutoresizingMaskIntoConstraints = false
                        self.view.addSubview(label)
                        
                        label.topAnchor.constraint(equalTo: self.nutrientsLabel.bottomAnchor, constant: 48).isActive = true
                        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
                        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 8).isActive = true
                    } else {
                        self.tableView.isHidden = false
                    }
                    self.healthText.isHidden = false
                    self.healthLabels.isHidden = false
                    self.nutrientsLabel.isHidden = false
                }.disposed(by: disposeBag)
                
            
            self.isFavorite = presenter.isFavorite(id: food.id)
        }
    }
    
    @IBAction func onFavoriteButtonClicked(_ sender: Any) {
        
        guard let presenter = presenter else { return }
        
        if let food = foodData {
            if isFavorite {
                presenter.removeFavoriteFood(id: food.id)
                    .observeOn(MainScheduler.instance)
                    .subscribe { success in
                        if success {
                            self.isFavorite = false
                            let alert = UIAlertController(title: "Food Removed", message: "This food has been removed from favorites.", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    } onError: { error in
                        print("Error \(error.localizedDescription)")
                    }.disposed(by: disposeBag)
            } else {
                presenter.addFavoriteFood(food: food)
                    .observeOn(MainScheduler.instance)
                    .subscribe { success in
                        if success {
                            self.isFavorite = true
                            let alert = UIAlertController(title: "Food Added", message: "This food has been added to favorites.", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    } onError: { error in
                        print("Error \(error.localizedDescription)")
                    }.disposed(by: disposeBag)
            }
        }
    }
}


// MARK: UITableView
extension FoodDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nutrients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "nutrientCell", for: indexPath) as? NutrientTableViewCell {
            
            let nutrient = nutrients[indexPath.row]
            cell.name.text = nutrient.label
            cell.value.text = "\(nutrient.quantity) \(nutrient.unit)"
            cell.selectionStyle = .none
        
            return cell
        }
        return UITableViewCell()
    }
}
