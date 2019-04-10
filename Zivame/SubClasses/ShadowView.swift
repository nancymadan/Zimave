//
//  ShadowView.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowRadius: CGFloat = 0.0
    @IBInspectable var shadowOffset: CGSize = CGSize.init(width: 0, height: 0)

    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOpacity = 1
    }

}
