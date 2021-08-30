//
//  Author.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 29.07.2021.
//

import Foundation
public struct Author: Codable {
    public var slug: String
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var bio: String?
    public var title: String?
    public var linkedinUrl: String?
    public var facebookUrl: String?
    public var pinterestUrl: String?
    public var instagramUrl: String?
    public var twitterHandle: String?
    public var profileImage: String?
    // With query include=recent_posts:
    public var recentPosts: [Post]?
}

public struct AuthorResponse: Codable {
    public var data: Author
}

public struct AuthorsResponse: Codable {
    public var data: [Author]
}
