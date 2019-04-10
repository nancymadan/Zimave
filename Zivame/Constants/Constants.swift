//
//  ColorConstants.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import Foundation
import UIKit

enum EnumAppColors: String {
    
    typealias RawValue = String
    
    case appThemeCode =  "#DA003E"
    case appSecondryCode =  "#282828"
}

let KScreenWidth = UIScreen.main.bounds.width
let KScreenHeight = UIScreen.main.bounds.height

let appThemeColor = UIColor.init(hexString: EnumAppColors.appThemeCode.rawValue)
let appSecendoryColor = UIColor.init(hexString: EnumAppColors.appSecondryCode.rawValue)

let fullStarImage: UIImage = UIImage(named: "ic_selected_star") ?? UIImage()
let halfStarImage: UIImage = UIImage(named: "ic_half_star") ?? UIImage()
let emptyStarImage: UIImage = UIImage(named: "ic_unselected_star") ?? UIImage()
