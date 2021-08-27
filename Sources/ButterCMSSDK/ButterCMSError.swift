//
//  ButterCMSError.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 09.08.2021.
//

import Foundation
public struct ButterCMSError: Error {
    enum Kind {
        case canNotConstructUrl
        case serverResponseNoOK(Int)
        case responseNotHTTPURLResponse
        case noDataReturned
        case canNotDecodeData(Data)
    }
    let error: Kind
}
