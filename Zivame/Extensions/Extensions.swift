//
//  Extensions.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static func loadFromNibNamed(_ nibNamed: String, xposition: CGFloat? = nil, bundle: Bundle? = nil) -> UIView? {
        let view = UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
        view?.frame = CGRect.init(x: xposition ?? 0.0, y: 0, width: KScreenWidth, height: KScreenHeight)
        return view
    }
  
}

extension String {
    func jsonPathToData(path: String) -> Product? {
        guard let path = Bundle.main.path(forResource: self, ofType: "json")
            else {
                return nil
        }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            do {
                let decoder = JSONDecoder()
                let productData = try decoder.decode(Product.self, from: jsonData)
                return productData
            } catch {
                // handle error
            }
        } catch {
            // handle error
        }
        return nil
    }
}

 extension UIColor {
     convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as String
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
