//
//  Category.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 31.07.2021.
//

import Foundation
public struct Category: Codable {
    public var slug: String
    public var name: String
    public var recentPosts: [Post]?
}

public struct CategoryResponse: Codable {
    public var data: Category
}

public struct CategoriesResponse: Codable {
    public var data: [Category]
}
