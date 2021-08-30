//
//  PaginationMeta.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 16.08.2021.
//

import Foundation
public struct PaginationMeta: Codable {
    public var count: Int
    public var previousPage: Int?
    public var nextPage: Int?
}
