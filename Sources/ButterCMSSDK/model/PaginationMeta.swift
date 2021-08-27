//
//  PaginationMeta.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 16.08.2021.
//

import Foundation
public struct PaginationMeta: Codable {
    var count: Int
    var previousPage: Int?
    var nextPage: Int?
}
