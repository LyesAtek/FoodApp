//
//  ProductViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 12/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class ProductViewController : UIViewController{
    
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
   
    var categoryViewModel : CategoryViewModel!
    let waitingTaskFinishes = DispatchGroup()
 
      
    var productsViewModel : [ProductViewModel] = []
    var categoryId : String!
    var categoryTitle : String!
    let cellReuseIdentifier : String = "productReuseIdentifier"
    let productCellView : String = "ProductCell"
    var hasSaveElements : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           self.collectionView.dataSource = self
        self.collectionView.delegate = self
         collectionView.register(UINib(nibName: productCellView, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        let collectionViewLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.estimatedItemSize = CGSize(width: 150, height: 200)
        
        fillProductsViewModel()
        
       
     
    }
    
    
    
    func fillProductsViewModel() {
        /*
         ********If the user does not have access to the internet, I check if he has any data saved for this category
         */
        if(!ConnectionManager.shared.isConnected){
            if(ProductOffline.getProductsByCategoryId(categoryId: self.categoryId).count > 0){
                hasSaveElements = true
                productTitle.text = categoryTitle
                self.productsViewModel = ProductOffline.getProductsByCategoryId(categoryId: categoryId)
            }else{
                productTitle.text = "Aucun accès à Internet"
            }
        }else{
            /*
             ********If the user has access to the internet, I use the saved data if there is any, or else I make a web service call
             */
            
            productTitle.text = categoryTitle
            if(ProductOffline.getProductsByCategoryId(categoryId: self.categoryId).count > 0){
                hasSaveElements = true
                self.productsViewModel = ProductOffline.getProductsByCategoryId(categoryId: categoryId)     }else{
                hasSaveElements = false
                self.waitingTaskFinishes.enter()
                GetProductByCategoryId()
                waitingTaskFinishes.notify(queue: DispatchQueue.main, work: DispatchWorkItem(block: {
                    self.refresh()
                    ProductOffline.saveProducts(products: self.productsViewModel)
                }))
            }
        }
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
        if(!hasSaveElements){
            waitingTaskFinishes.wait()
        }
        return productsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(!hasSaveElements){
            waitingTaskFinishes.wait()
        }
        let cell : ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier , for: indexPath) as! ProductCell
        cell.productViewModel = productsViewModel[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath){
        
        let productPopUp = ProductDescriptionViewController()
        productPopUp.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        productPopUp.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(productPopUp, animated: false, completion: nil)
        
     //   self.
   //     self.navigationController?.present(productPopUp, animated: false, completion: nil)
        
    }
 
   
    
    //Refresh collectionView after result webservice
    func refresh(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    
}
