//
//  MainViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class CategoryViewController : UIViewController{
    
    let waitingTaskFinishes = DispatchGroup()
    
    var categoriesViewModel : [CategoryViewModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    let cellReuseIdentifier : String = "CategoryCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Initialize CollectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    //    collectionView.translatesAutoresizingMaskIntoConstraints = false
        
         //Call Methode services to get Categories
        self.waitingTaskFinishes.enter()
        GetCategories()
        waitingTaskFinishes.notify(queue: DispatchQueue.main, work: DispatchWorkItem(block: {
            self.refresh()
        }))
    }
   
    func GetCategories(){
        WBCategory.shared.GetCategories(){
            (result : [Category]) in
            for category in result{
                self.categoriesViewModel.append(CategoryViewModel(category: category))
            }
            self.waitingTaskFinishes.leave()
        }
    }
    
}


extension CategoryViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Waiting until the task finishes
        waitingTaskFinishes.wait()
        
        return categoriesViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Waiting until the task finishes
        waitingTaskFinishes.wait()
        
        let cell : CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier , for: indexPath) as! CategoryCell
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        cell.categoryViewModel = categoriesViewModel[indexPath.row]
        
        return cell
    }
    
    //Select cell action
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
        let productView = ProductViewController()
        self.navigationController?.pushViewController(productView, animated: true)
    }
    
    //Refresh collectionView after result webservice
    func refresh(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
}
