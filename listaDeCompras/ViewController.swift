//
//  ViewController.swift
//  listaDeCompras
//
//  Created by Raphael A. P. Oliveira on 16/09/20.
//  Copyright © 2020 Raphael A. P. Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    
    @IBOutlet weak var labelProduct: UILabel!
    @IBOutlet weak var labelProductItems: UILabel!
    
    @IBOutlet weak var buttonEditSave: UIButton!
    @IBOutlet weak var buttonRemove: UIButton!
    @IBOutlet weak var buttonClear: UIButton!
    
    private var itemManager = ItemManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atribui os delegates
        textFieldName.delegate = self
        textFieldQuantity.delegate = self
        
        // Deixa o botão invisível
        hideButton(button: buttonRemove)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func buttonEditSaveTapped(_ sender: UIButton) {
        if !textFieldName.isEmpty() && !textFieldQuantity.isEmpty() {
            let name = textFieldName.getCleanedValue()
            // coalescing força o vazio a ser zero (Optional -> Int)
            let quantity = Int(textFieldQuantity.getCleanedValue()) ?? 0
            
            if !itemManager.exists(name) {
                // Mostrar a quantidade
                labelProduct.text = "Produto novo"
                
                if let item = itemManager.create(name: name, quantity: quantity) {
                    labelProduct.text = "\(item.name)"
                    if var text = labelProductItems.text {
                        text += "\(item.name) - \(item.quantity) \n"
                        print(text)
                        labelProductItems.text = itemManager.getAllItems()
                        
                        clearTextFields()
                    }
                }
            } else {
                labelProduct.text = "Produto já existente"
                itemManager.edit(name: name, newQuantity: quantity)
                labelProductItems.text = itemManager.getAllItems()
            }
        }
        view.endEditing(true)
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        view.endEditing(true)
        clearTextFields()
        changeTextFieldNames()
        hideButton(button: buttonRemove)
    }
    
    @IBAction func buttonRemoveTapped(_ sender: UIButton) {
        view.endEditing(true)
        if !textFieldName.isEmpty() {
            itemManager.remove(name: textFieldName.getCleanedValue())
            labelProductItems.text = itemManager.getAllItems()
            clearTextFields()
        }
        changeTextFieldNames()
    }

    func getItemManager() -> ItemManager {
        return itemManager
    }
}
