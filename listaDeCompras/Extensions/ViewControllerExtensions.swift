//
//  ViewControllerExtensions.swift
//  listaDeCompras
//
//  Created by Marivaldo Sena on 17/09/20.
//  Copyright © 2020 Raphael A. P. Oliveira. All rights reserved.
//

import UIKit

// MARK: - ViewController: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == textFieldName {
            if !textField.isEmpty() {
                if getItemManager().exists(textField.getCleanedValue()) {
                    if let item = getItemManager().getItem(textField.getCleanedValue()) {
                        textFieldQuantity.text = String(item.quantity)
                        
                        self.showButton(button: buttonRemove)
                        self.changeTextFieldNamesForExistingProduct()
                    }
                } else {
                    self.changeTextFieldNames()
                    self.hideButton(button: buttonRemove)
                }
                labelProductItems.text = getItemManager().getAllItems()
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldQuantity {
            textField.text = String(getQuantityValue(name: textFieldName.getCleanedValue()))
        }
    }
    
    private func getQuantityValue(name: String) -> Int {
        if let item = getItemManager().getItem(name) {
            self.showButton(button: buttonRemove)
            self.changeTextFieldNamesForExistingProduct()
            
            return item.quantity
        }
        return 0
    }
}

// MARK: - ViewController
extension ViewController {
    func showButton(button: UIButton) {
        button.isHidden = false
    }
    
    func hideButton(button: UIButton) {
        button.isHidden = true
    }
    
    func clearTextFields() {
        textFieldName.text = ""
        textFieldQuantity.text = ""
    }
    
    func changeTextFieldNamesForExistingProduct() {
        buttonEditSave.setTitle("Salvar edição", for: .normal)
    }
    
    func changeTextFieldNames() {
        buttonEditSave.setTitle("Salvar", for: .normal)
    }
}

// MARK: - UIViewController
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
