//
//  UserTextField.swift
//  define-app
//
//  Created by Daniel Bonehill on 09/08/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

@IBDesignable
class UserTextField: UITextField {
    
    override func awakeFromNib() {
        self.borderStyle = .none
        self.font = UIFont(name: "AvenirNext-Regular", size: 17.0)
        self.textColor = #colorLiteral(red: 0.6901960784, green: 0.6235294118, blue: 0.6705882353, alpha: 1) // #B09FAB
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.awakeFromNib()
    }
}
