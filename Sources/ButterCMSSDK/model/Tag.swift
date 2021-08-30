//
//  Tag.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 31.07.2021.
//

import Foundation
public struct Tag: Codable {
    public var slug: String
    public var name: String
    public var recentPosts: [Post]?
}

public struct TagResponse: Codable {
    public var data: Tag
}

public struct TagsResponse: Codable {
    public var data: [Tag]
}
