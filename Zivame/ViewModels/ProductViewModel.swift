//
//  ProductViewModel.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import Foundation
import UIKit

struct ProductViewModel {
    
    let basicDetails: BasicDetailViewModel
    let fabricDetails: FabricViewModel
    let reviews: ReviewsTab
    
    static func  BasicData(selectedTab: Int) -> [BasicViewModel] {
        guard let productData = "Tests".jsonPathToData(path: ".json") else {
            return []
        }
        switch selectedTab {
        case 0:
            let details = productData.details.basicDetailsTab.values.map { detail -> BasicDetailViewModel in
                let sM = BasicDetailViewModel.init(detail: detail)
                return sM
            }
            return details
        case 1:
            var fabricDetails = [FabricViewModel]()
            productData.details.fabricAndCareTab.values.forEach { value -> Void in
                let fabricLIst = value.list
                fabricDetails = fabricLIst.map { fabric -> FabricViewModel in
                    let fM = FabricViewModel.init(detail: fabric)
                    return fM
                }
            }
            return fabricDetails
        case 2:
            var reviewDetails = [ReviewViewModel]()
            productData.details.reviewsTab.values.forEach { value -> Void in
                let reviews = value.reviews
                reviewDetails = reviews.map { review -> ReviewViewModel in
                    let fM = ReviewViewModel.init(detail: review)
                    return fM
                }
                
            }
            return reviewDetails
        default:
            let details = productData.details.basicDetailsTab.values.map { detail -> BasicDetailViewModel in
                let sM = BasicDetailViewModel.init(detail: detail)
                return sM
            }
            return details
        }
        
    }
    
    /** cellIdentifier :- Map the view model with the cell identifier (which will be moved to the Controller)
     */
    static func cellIdentifier(for viewModel: BasicViewModel) -> String {
        switch viewModel {
        case is BasicDetailViewModel:
            
            return String(describing: ProductTableViewCell.self)
        case is FabricViewModel:
            return String(describing: ProductTableViewCell.self)
        case is ReviewViewModel:
            return String(describing: ReviewTableViewCell.self)
            
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
    
    // MARK: - Set up Scroll
    /** set up scroll's content
     - parameter scrollV : The scroll view's whose value needs to be updated
     */
    static func setUpScroll(scrollV: UIScrollView) {
        
        guard let tbl1 = UIView.loadFromNibNamed(String(describing: ProductTableView.self), xposition: 0.0) as? ProductTableView
            else {
                return
        }
        guard let tbl2 = UIView.loadFromNibNamed(String(describing: ProductTableView.self), xposition: KScreenWidth) as? ProductTableView
            else {
                return
        }
        guard let tbl3 = UIView.loadFromNibNamed(String(describing: ProductTableView.self), xposition: 2 * KScreenWidth) as? ProductTableView
            else {
                return
        }
        tbl1.selectedTab = 0
        tbl2.selectedTab = 1
        tbl3.selectedTab = 2
        let tabs  = [tbl1, tbl2, tbl3]
        for tab in tabs {
            tab.reloadData()
            scrollV.addSubview(tab)
        }
    }
    /** make changes by selected button and unselecting rest
     - parameter selectedButton : The button selected by the user or that needs to be highlighted
     - parameter allButtons : The collection of all buttons
     - parameter onScrollView : The scroll view that changes the highlighting button
     - parameter lineLeadConstraint : The highliting line's leading constraint
     
     */
    static func selectButton(selectedButton: UIButton, allButtons: [UIButton], onScrollView: UIScrollView, lineLeadConstraint: NSLayoutConstraint) {
        lineLeadConstraint.constant = selectedButton.frame.size.width * CGFloat(allButtons.firstIndex(of: selectedButton) ?? 0)
        allButtons.forEach { btn -> Void in
            btn.setTitleColor(btn == selectedButton ? appThemeColor : appSecendoryColor, for: .normal)
        }
        onScrollView.setContentOffset(CGPoint.init(x: KScreenWidth * CGFloat(allButtons.firstIndex(of: selectedButton) ?? 0), y: 0), animated: true)
    }
    
    /** check scroll view's content offset and select/unselect buttons accordingly
     - parameter selectedButton : The button selected by the user or that needs to be highlighted
     - parameter allButtons : The collection of all buttons
     - parameter onScrollView : The scroll view that changes the highlighting button
     - parameter lineLeadConstraint : The highliting line's leading constraint
     */
    static  func checkScrollOffsetAndSetUI( allButtons: [UIButton], onScrollView: UIScrollView, lineLeadConstraint: NSLayoutConstraint) {
        if onScrollView.contentOffset.x <= KScreenWidth / 2 {
            self.selectButton(selectedButton: allButtons[0], allButtons: allButtons, onScrollView: onScrollView, lineLeadConstraint: lineLeadConstraint)
        } else if onScrollView.contentOffset.x > KScreenWidth / 2 && onScrollView.contentOffset.x <= 1.5 * KScreenWidth {
            self.selectButton(selectedButton: allButtons[1], allButtons: allButtons, onScrollView: onScrollView, lineLeadConstraint: lineLeadConstraint)
            
        } else {
            self.selectButton(selectedButton: allButtons[2], allButtons: allButtons, onScrollView: onScrollView, lineLeadConstraint: lineLeadConstraint)
        }
    }
    
    /** get star image according to star sequence and rating
     - parameter starNumber : sequence of star in star's collection
     - parameter rating : Rating to be shown
     */
    static func getStarImage(starNumber: Double, forRating rating: Double) -> UIImage {
        if rating >= starNumber {
            return fullStarImage
        } else if rating + 0.5 == starNumber {
            return halfStarImage
        } else {
            return emptyStarImage
        }
    }
    
}

struct BasicDetailViewModel: BasicViewModel {
    var description: String
    
    init(detail: BasicDetailsTabValue) {
        self.description = detail.description
    }
}
struct FabricViewModel: BasicViewModel {
    var description: String
    
    init(detail: String) {
        self.description = detail
    }
}
struct ReviewViewModel: ReviewBasicViewModel {
    var description: String
    var rating: Double?
    var likes: Int?
    var timeLine: String?
    var reviewID: Int?
    var customerName: String?
    
    init(detail: Review) {
        self.description = detail.description
        self.rating = detail.rating
        self.likes = detail.likes
        self.timeLine = detail.timeLine
        self.reviewID = detail.reviewID
        self.customerName = detail.customerName
    } 
}
