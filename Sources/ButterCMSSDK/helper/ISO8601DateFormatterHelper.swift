//
//  File.swift
//  
//
//  Created by Martin Srb on 05.08.2021.
//
// Swift can not automatically handle iso8601 dates with and without fractional seconds.

import Foundation

@available(macOS 10.13, *)
extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    @available(macOS 10.13, *)
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
    @available(macOS 10.13, *)
    static let iso8601 = ISO8601DateFormatter([.withInternetDateTime])
}
