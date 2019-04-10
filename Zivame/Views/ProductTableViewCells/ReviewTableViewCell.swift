//
//  ReviewTableViewCell.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet private var btnStars: [UIButton]!
    @IBOutlet weak private var btnLikeCount: UIButton!
    @IBOutlet weak private var lblTime: UILabel!
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: BasicViewModel) {
        guard let reviewViewModel = viewModel as? ReviewViewModel else {
            return
        }
        self.lblDescription.text = reviewViewModel.description
        self.lblName.text = reviewViewModel.customerName ?? ""
        self.lblTime.text = reviewViewModel.timeLine
        self.btnLikeCount.setTitle("\(reviewViewModel.likes ?? 0)", for: .normal)
        
        self.btnLikeCount.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -16, bottom: 0, right: 0)
        for (index, btn) in self.btnStars.enumerated() {
            btn.setImage(ProductViewModel.getStarImage(starNumber: Double(index + 1), forRating: reviewViewModel.rating ?? 0), for: .normal)
        }
    }
}
