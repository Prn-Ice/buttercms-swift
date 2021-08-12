//
//  ButterCMSError.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 09.08.2021.
//

import Foundation
public struct ButterCMSError: Error {
    enum ErrorKind {
        case wrongURLComponent(String)
        case serverResponseNoOK(Int)
        case responseNotHTTPURLResponse
        case noDataReturned
        case canNotDecodeData(Data)
    }
    let error: ErrorKind
}
