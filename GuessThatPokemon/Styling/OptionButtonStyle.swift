//
//  OptionButtonStyle.swift
//  GuessThatPokemon
//
//  Created by Christian Elijah on 2020-10-28.
//

import UIKit

class OptionButtonStyle: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buttonStyling()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonStyling()
    }
    
    func buttonStyling() {
        layer.cornerRadius = 12
    }
}
