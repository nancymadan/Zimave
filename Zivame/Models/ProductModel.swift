//
//  ProductModel.swift
//  Zivame
//
//  Created by nancy on 09/04/19.
//  Copyright © 2019 nancy. All rights reserved.
//

import Foundation

struct Product: Codable {
    let details: Details
}

struct Details: Codable {
    let basicDetailsTab: BasicDetailsTab
    let fabricAndCareTab: FabricAndCareTab
    let reviewsTab: ReviewsTab
}

struct BasicDetailsTab: Codable {
    let values: [BasicDetailsTabValue]
    let count: Int
    
}

struct BasicDetailsTabValue: Codable {
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case description = "text"
    }
}

struct FabricAndCareTab: Codable {
    let values: [FabricAndCareTabValue]
    let count: Int
}

struct FabricAndCareTabValue: Codable {
    let list: [String]
}

struct ReviewsTab: Codable {
    let values: [ReviewsTabValue]
    let count: Int
}

struct ReviewsTabValue: Codable {
    let reviews: [Review]
    let rating, totalReviewCount: Int
}

struct Review: Codable {
    let description: String
    let rating: Double
    let likes: Int
    let timeLine: String
    let reviewID: Int
    let customerName: String
    
    enum CodingKeys: String, CodingKey {
        case description, rating, likes, timeLine
        case reviewID = "reviewId"
        case customerName
    }
}
