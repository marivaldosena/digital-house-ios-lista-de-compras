//
//  Item.swift
//  listaDeCompras
//
//  Created by Raphael A. P. Oliveira on 16/09/20.
//  Copyright © 2020 Raphael A. P. Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var name: String
    var quantity: Int
    
    init (name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
    
}
