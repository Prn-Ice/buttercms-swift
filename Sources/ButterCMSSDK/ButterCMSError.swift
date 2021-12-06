//
//  ButterCMSError.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 09.08.2021.
//

import Foundation
public struct ButterCMSError: Error {
public enum Kind {
        case canNotConstructUrl
        case serverResponseNotOK(Int)
        case responseNotHTTPURLResponse
        case noDataReturned
        case canNotDecodeData(Data)
    }
public  let error: Kind
}
