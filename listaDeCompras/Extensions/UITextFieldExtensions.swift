//
//  UITextFieldExtension.swift
//  listaDeCompras
//
//  Created by Marivaldo Sena on 17/09/20.
//  Copyright © 2020 Raphael A. P. Oliveira. All rights reserved.
//

import UIKit

extension UITextField {
    public func isEmpty() -> Bool {
        if let text = text, !text.isEmpty {
            return false
        }
        return true
    }
    
    public func getCleanedValue() -> String {
        if !isEmpty(), var text = text {
            text = text.folding(options: .diacriticInsensitive, locale: .current).lowercased()
            return text
        }
        return ""
    }
}
