//
//  ItemManager.swift
//  listaDeCompras
//
//  Created by Raphael A. P. Oliveira on 16/09/20.
//  Copyright © 2020 Raphael A. P. Oliveira. All rights reserved.
//

// - Eu posso: Criar, Editar, Excluir

import Foundation

class ItemManager {
    
    var items: [Item] = []
    
    func create(name: String, quantity: Int) -> Item? {
        if !exists(name) {
            let item = Item(name: name, quantity: quantity)
            items.append(item)
            
            return item
        }
        
        return nil
    }
    
    func edit(name: String, newQuantity: Int) {
        
        // Encontrar produto baseado no nome
        // Lambda function
        //let isFound = items.contains { (item) -> Bool in
        //    return item.name == name
        //}
        let index = items.firstIndex { (item) -> Bool in
            return item.name == name
        }
        
        // Alterar atributo
        // unwrapping para ver se não é Optional
        if let index = index {
            items[index].quantity = newQuantity
        }
        
    }
    
    func remove(name: String) {
        // retornando todos os elementos != name para items
        items = items.filter { (item) -> Bool in
            return item.name != name
        }
    }
    
    func exists(_ name: String) -> Bool {
        // contains é uma função anônima (closure)
        // $0: placeholder (variável anônima, $0$1...)
        return items.contains {$0.name == name}
    }
    
    // Paramos aqui... 16.set @ 11h55
    func getItem(_ name: String) -> Item? {
        if exists(name) {
            let item = items.filter { $0.name == name }
            return item[0]
        }
        return nil
    }
    
    func getAllItems() -> [Item] {
        return items
    }
    
    func getAllItems() -> String {
        var result = ""
        
        for item in items {
            result += "Name: \(item.name) - Qty: \(item.quantity)\n"
        }
        
        return result
    }
}
