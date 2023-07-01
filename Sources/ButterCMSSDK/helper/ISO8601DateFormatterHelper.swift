//
//  ISO8601DateFormatterHelper.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 05.08.2021.
//
// Swift can not automatically handle iso8601 dates with and without fractional seconds.

import Foundation

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
    static let iso8601 = ISO8601DateFormatter([.withInternetDateTime])
    static let iso8601DateTime = ISO8601DateFormatter([.withFullDate, .withTime, .withColonSeparatorInTime])
}
