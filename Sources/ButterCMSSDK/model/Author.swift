//
//  Author.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 29.07.2021.
//

import Foundation
public struct Author: Codable {
    var slug: String
    var firstName: String
    var lastName: String
    var email: String
    var bio: String
    var title: String
    var linkedinUrl: String
    var facebookUrl: String
    var pinterestUrl: String
    var instagramUrl: String
    var twitterHandle: String
    var profileImage: String
    // With query include=recent_posts:
    var recentPosts: [Post]?
}

public struct AuthorResponse: Codable {
    var data: Author
}

public struct AuthorsResponse: Codable {
    var data: [Author]
}
