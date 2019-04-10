//
//  ProductTableView.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import UIKit

class ProductTableView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak private var mainTableView: UITableView!
    
    var selectedTab = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /// resgiter cells with TableView
        self.mainTableView.register(UINib.init(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        self.mainTableView.register(UINib.init(nibName: String(describing: ReviewTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ReviewTableViewCell.self))
        
        /// set table footer with zero rect so that seperators does'nt show for non existing cells
        self.mainTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
    }
    func reloadData() {
        /// hide separator for last tab
        self.mainTableView.separatorStyle = selectedTab == 2 ? .none : .singleLine
        self.mainTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ProductViewModel.BasicData(selectedTab: self.selectedTab).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = ProductViewModel.BasicData(selectedTab: self.selectedTab)[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductViewModel.cellIdentifier(for: rowViewModel), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        return cell
    }
}
