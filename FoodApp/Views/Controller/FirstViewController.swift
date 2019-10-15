//
//  FirstViewController.swift
//  FoodApp
//
//  Created by Lyes ATEK on 15/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import UIKit

class FirstViewController : UIViewController{

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var continuButton: UIButton!
    let maxPhoneTextFieldLenght = 10
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        errorLabel.text = ""
        phoneTextField.delegate = self
        
    }
    
    @IBAction func continuButtonPressed(_ sender: Any) {
        if(!verifyPhoneNumber()){
            errorLabel.text = "Numero invalide"
        }else{
            CartManager.shared.numberOfUser = phoneTextField.text ?? ""
            let paiementViewController = PaiementChoiceViewController()
            self.navigationController?.pushViewController(paiementViewController, animated: true)
        }
    }
    
    func verifyPhoneNumber()->Bool{
        let currentText = phoneTextField.text ?? ""
        if(currentText.count == 10 && currentText.first == "0"){
            return true
        }
        return false
    }
    
}


extension FirstViewController : UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneTextField.resignFirstResponder()
        return(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let currentText : String = phoneTextField!.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= maxPhoneTextFieldLenght
    }
}
