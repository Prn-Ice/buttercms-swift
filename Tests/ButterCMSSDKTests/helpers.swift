//
//  File.swift
//  
//
//  Created by Martin Srb on 20.08.2021.
//

import Foundation
extension URLComponents {
    func isEqual (rhs: URLComponents) -> Bool {
        guard let lhsQueryItems = self.queryItems?.sorted(by: { $0.name < $1.name }),
        let rhsQueryItems = rhs.queryItems?.sorted(by: { $0.name < $1.name }) else { return false }
        return lhsQueryItems.elementsEqual(rhsQueryItems, by: { $0 == $1 }) &&
        self.scheme == rhs.scheme &&
        self.host == rhs.host &&
        self.path == rhs.path
    }
}
