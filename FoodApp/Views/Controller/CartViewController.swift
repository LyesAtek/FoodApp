//
//  CartViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 13/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class CartViewController : UIViewController{
    
   
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    var productsViewModel : [ProductViewModel] = []
    var sections : [ExpandableSection] = []
    let cellReuseIdentifier : String = "cartReusesIdentifier"
    let cartCellView : String = "CartCell"
    var footerView : CartFooterTableView!
    var total : Float = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productsViewModel = CartManager.shared.productsViewModel
        calculateTotalPriceProduct()
        totalPrice.text = "Total : " + String(format: "%.2f", total) + " €"
        buildSections()
        self.refresh()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cartCellView, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
       
    }
    
    func calculateTotalPriceProduct(){
        total = 0
        for product in productsViewModel{
            total += product.productPrice
        }
    }
    
    func buildSections(){
        sections = []
        for product in productsViewModel{
            if(!hasExistedSection(productTitle: product.productTitle)){
                sections.append(ExpandableSection(isExpanded: true, products: [product]))
            }else{

                let index = findIndexSection(product: product)
                if(index != -1){
                    sections[index].products.append(product)
                }
            }
        }
        
    }
    
    func findIndexSection(product : ProductViewModel)->Int{
        for i in 0..<sections.count{
            if(sections[i].products[0].productTitle == product.productTitle){
                return i
            }
        }
        return -1
    }
    
    func hasExistedSection(productTitle : String)->Bool{
        for i in 0..<sections.count{
            if(sections[i].products[0].productTitle == productTitle){
                return true
            }
        }
        return false
    }
    
    @IBAction func commandButtonPressed(_ sender: Any) {
        var products : [[ProductViewModel]] = []
        for section in sections{
           products.append(section.products)
        }
        let orderViewModel = OrderViewModel(userPhone: CartManager.shared.numberOfUser, products: products, paid: CartManager.shared.paid)
        createOrder(orderViewModel: orderViewModel)
        
    }
    
    func createOrder(orderViewModel : OrderViewModel){
        //TODO Call WBCreateOrder
        
        if(CartManager.shared.paid){
            //TODO Paiement Bank Card
            let cartPopUp = PopUpCartViewController()
            cartPopUp.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            cartPopUp.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            self.present(cartPopUp, animated: false, completion: nil)
        }else{
            let cartPopUp = PopUpCartViewController()
            cartPopUp.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            cartPopUp.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            self.present(cartPopUp, animated: false, completion: nil)
        }
        
       
    }
    
}



extension CartViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!sections[section].isExpanded){
            return 0
        }
        return sections[section].products.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CartCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier , for: indexPath) as! CartCell
        
        cell.productViewModel = sections[indexPath.section].products[indexPath.row]
       
        
        return cell
    }
   
    //TODO Delete Product
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
   
  

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSectionView = (CartHeaderSectionTableView.instanceFromNib() as! CartHeaderSectionTableView)
        headerSectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: headerSectionView.frame.height)
       
        headerSectionView.sectionTitle.text = sections[section].products[0].productTitle
        
        headerSectionView.button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        headerSectionView.button.tag = section
        return headerSectionView
    }
    
    @objc func handleExpandClose(button : UIButton){
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in sections[section].products.indices{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = sections[section].isExpanded
        sections[section].isExpanded = !isExpanded
        button.setTitle(isExpanded ? "Ouvrir" : "Fermer", for: .normal)
        if(isExpanded){
             tableView.deleteRows(at: indexPaths, with: .fade)
        }else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
    
    //Refresh collectionView after result webservice
    func refresh(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}



