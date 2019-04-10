//
//  Protocols.swift
//  DrinsedCustomer
//
//  Created by Dev on 25/03/19.
//  Copyright © 2019 Dev. All rights reserved.
//

import UIKit
protocol BasicViewModel {
    var description: String { get set }
}
protocol ReviewBasicViewModel: BasicViewModel {
    var rating: Double? { get set }
    var likes: Int? { get set }
    var timeLine: String? { get set }
    var reviewID: Int? { get set }
    var customerName: String? { get set }
}

protocol CellConfigurable {
   func setup(viewModel: BasicViewModel) // Provide a generic function }
 }
