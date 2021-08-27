//
//  ISO8601DateFormatterHelper.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 05.08.2021.
//
// Swift can not automatically handle iso8601 dates with and without fractional seconds.

import Foundation

@available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)
extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    @available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
    @available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)
    static let iso8601 = ISO8601DateFormatter([.withInternetDateTime])
}
