//
//  SubmitButton.swift
//  define-app
//
//  Created by Daniel Bonehill on 09/08/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

@IBDesignable
class SubmitButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = #colorLiteral(red: 0.6901960784, green: 0.6235294118, blue: 0.6705882353, alpha: 1) // #B09FAB
        self.setTitleShadowColor(#colorLiteral(red: 0.768627451, green: 0.7098039216, blue: 0.7490196078, alpha: 1), for: .normal) // #C4B5BF
        self.layer.cornerRadius = 25
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        
        self.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.awakeFromNib()
    }
}
