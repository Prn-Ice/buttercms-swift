//
//  File.swift
//  
//
//  Created by Martin Srb on 31.07.2021.
//

import Foundation
public struct Tag: Codable {
    var slug: String
    var name: String
    var recentPosts: [Post]?
}

public struct TagResponse: Codable {
    var data: Tag
}

public struct TagsResponse: Codable {
    var data: [Tag]
}

