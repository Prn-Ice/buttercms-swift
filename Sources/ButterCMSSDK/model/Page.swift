//
//  Page.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 16.08.2021.
//

import Foundation
public struct Page<T:Codable>: Codable {
    var slug: String
    var name: String
    var published: Date?
    var updated: Date?
    var pageType: String?
    var fields: T
}

public struct PageResponse<T:Codable>: Codable {
    var data: Page<T>
}

public struct PagesResponse<T:Codable>: Codable {
    var meta: PaginationMeta
    var data: [Page<T>]
}
