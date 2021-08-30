//
//  Collection.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 16.08.2021.
//

import Foundation
public class Collection<Item: CollectionItem>: Decodable {
    public var items: [Item]

    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
            init?(intValue: Int) {
                // We are not using this, thus just return nil
                return nil
        }
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        guard let itemsKey = container.allKeys.first else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "No data to decode"))
        }
        let decodedObject = try container.decode([Item].self, forKey: DynamicCodingKeys(stringValue: itemsKey.stringValue)!)
        self.items = decodedObject
    }
}

public protocol CollectionItem: Decodable {
    var meta: CollectionItemMeta { get set }
}

public struct CollectionItemMeta: Decodable {
    public var id: Int
}

public struct CollectionResponse<Item: CollectionItem>: Decodable {
    public var data: Collection<Item>
    public var meta: PaginationMeta
}
