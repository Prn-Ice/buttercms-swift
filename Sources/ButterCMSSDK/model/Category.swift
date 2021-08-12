//
//  Category.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 31.07.2021.
//

import Foundation
public struct Category: Codable {
    var slug: String
    var name: String
    var recentPosts: [Post]?
}

public struct CategoryResponse: Codable {
    var data: Category
}
