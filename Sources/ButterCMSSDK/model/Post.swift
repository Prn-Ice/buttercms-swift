//
//  File.swift
//  
//
//  Created by Martin Srb on 29.07.2021.
//

import Foundation
public struct Post: Codable {
    var status: Status
    var created: Date
    var updated: Date
    var published: Date
    var title: String
    var slug: String
    var body: String
    var summary: String
    var seoTitle: String
    var metaDescription: String
    var featuredImage: String
    var featuredImageAlt: String
    var url: String
    var author: Author;
    var tags: [Tag]?
    var categories: [Category]?
}

import Foundation
public struct PostMeta: Codable {
    var previousPage: PostSummary?
    var nextPage: PostSummary?
    var count: Int
}

public struct PostSummary: Codable {
    var slug: String
    var title: String
    var featuredImage: String
}

public enum Status:String, Codable {
    case DRAFT = "default"
    case PUBLISHED = "published"
}

public struct PostResponse: Codable {
    var data: Post
}

public struct PostsResponse: Codable {
    var data: [Post]
    var meta: PostMeta
}
