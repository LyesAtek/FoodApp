//
//  ProductViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class ProductViewController : UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var categoryViewModel : CategoryViewModel!
    let waitingTaskFinishes = DispatchGroup()
 
      
    var productsViewModel : [ProductViewModel] = []
    let cellReuseIdentifier : String = "productReuseIdentifier"
    let productCellView : String = "ProductCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
           self.collectionView.dataSource = self
        self.collectionView.delegate = self
         collectionView.register(UINib(nibName: productCellView, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        
        //Call Methode services to get Categories
        self.waitingTaskFinishes.enter()
        GetProductByCategoryId()
        waitingTaskFinishes.notify(queue: DispatchQueue.main, work: DispatchWorkItem(block: {
            self.refresh()
        }))
    }
    
    func GetProductByCategoryId(){
        WBProduct.shared.GetProduct(categoryId: categoryViewModel.categoryId){
            (result : [Product]) in
            for product in result{
                self.productsViewModel.append(ProductViewModel(product: product))
            }
            self.waitingTaskFinishes.leave()
        }
        
    }
}

// Function CollectionView
extension ProductViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         waitingTaskFinishes.wait()
        return productsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         waitingTaskFinishes.wait()
        let cell : ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier , for: indexPath) as! ProductCell
        cell.productViewModel = productsViewModel[indexPath.row]
        return cell
    }
    
    
    //Refresh collectionView after result webservice
    func refresh(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    
}
