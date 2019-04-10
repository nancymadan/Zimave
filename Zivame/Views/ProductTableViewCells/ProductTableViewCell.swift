//
//  ProductTableViewCell.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell, CellConfigurable {
   
    @IBOutlet weak private var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(viewModel: BasicViewModel) {
        self.lblDescription.text = viewModel.description
    }
    
}
