//
//  FieldTitleLabel.swift
//  define-app
//
//  Created by Daniel Bonehill on 09/08/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class FieldTitleLabel: UILabel {

    override func awakeFromNib() {
        self.font = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
        self.textColor = #colorLiteral(red: 0.6901960784, green: 0.6235294118, blue: 0.6705882353, alpha: 1) // #B09FAB
    }

}
