//
//  ProductViewController.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak private var mainScrollView: UIScrollView!
    @IBOutlet private var btnsTop: [UIButton]!
    @IBOutlet weak private var mainStackView: UIStackView!
    @IBOutlet weak private var lblHighlightLine: UILabel!
    @IBOutlet weak private var constraintHighlightLead: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        /// set up data in scroll view
        ProductViewModel.setUpScroll(scrollV: self.mainScrollView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /// reset scroll view content size, when the frames are set
        let scrollFrame = self.mainScrollView.frame
        self.mainScrollView.contentSize = CGSize.init(width: 3 * KScreenWidth, height: scrollFrame.height)
    }
    
    // MARK: - Button actions
    @IBAction func actionTabs(_ sender: UIButton) {
        ProductViewModel.selectButton(selectedButton: sender, allButtons: self.btnsTop, onScrollView: mainScrollView, lineLeadConstraint: self.constraintHighlightLead)
    }
    
}

extension ProductViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.constraintHighlightLead.constant = scrollView.contentOffset.x / 3
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        ProductViewModel.checkScrollOffsetAndSetUI(allButtons: self.btnsTop, onScrollView: mainScrollView, lineLeadConstraint: self.constraintHighlightLead)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            ProductViewModel.checkScrollOffsetAndSetUI(allButtons: self.btnsTop, onScrollView: mainScrollView, lineLeadConstraint: self.constraintHighlightLead)
        }
    }
}
