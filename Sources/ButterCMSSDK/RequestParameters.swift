//
//  RequestParameters.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 19.08.2021.
//

import Foundation

internal protocol Parameters {
    func getParam() -> (String, String)
}

public enum StoringDirection: String {
    case asc = ""
    case desc = "-"
}

public struct ApiKeyParameter: Parameters {
    let apiKey: String
    func getParam() -> (String, String) {
        return ("auth_token", apiKey)
    }
}

 // MARK: Blog Engine parameters

public enum AuthorParameters: Parameters {
    case include
    func getParam() -> (String, String) {
        switch self {
        case .include: return ("include", "recent_posts")
        }
    }
}

public enum CategoryParameters: Parameters {
    case include
    func getParam() -> (String, String) {
        switch self {
        case .include: return ("include", "recent_posts")
        }
    }
}

public enum TagParameters: Parameters {
    case include
    func getParam() -> (String, String) {
        switch self {
        case .include: return ("include", "recent_posts")
        }
    }
}

public enum PostsParameters: Parameters {
    case preview
    case page(value: Int)
    case pageSize(value: Int)
    case excludeBody
    case authorSlug(value: String)
    case categorySlug(value: String)
    case tagSlug(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .preview: return ("preview", "1")
        case .page(let value): return ("page", String(value))
        case .pageSize(let value): return ("page_size", String(value))
        case .excludeBody: return ("exclude_body", "true")
        case .authorSlug(let value): return ("author_slug", value)
        case .categorySlug(let value): return ("category_slug", value)
        case .tagSlug(let value): return ("tag_slug", value)
        }
    }
}

public enum PostSearchParameters: Parameters {
    case query(value: String)
    case page(value: Int)
    case pageSize(value: Int)
    func getParam() -> (String, String) {
        switch self {
        case .query(let value): return ("query", value)
        case .page(let value): return ("page", String(value))
        case .pageSize(let value): return ("page_size", String(value))
        }
    }
}
// MARK: Page parameters

public enum PageParameters: Parameters {
    case preview
    case locale(value: String)
    case levels(value: Int)
    func getParam() -> (String, String) {
        switch self {
        case .preview: return ("preview", "1")
        case .locale(let value): return ("locale", value)
        case .levels(let value): return ("levels", String(value))
        }
    }
}

public enum PagesParameters: Parameters {
    case preview
    case page(value: Int)
    case pageSize(value: Int)
    case locale(value: String)
    case levels(value: Int)
    case order(value:String)
    case fields(key: String, value: String)
    func getParam() -> (String, String) {
        switch self {
        case .preview: return ("preview", "1")
        case .page(let value): return ("page", String(value))
        case .pageSize(let value): return ("page_size", String(value))
        case .locale(let value): return ("locale", value)
        case .levels(let value): return ("levels", String(value))
        case .order(let value): return("order", value)
        case .fields(let key, let value): return ("fields." + key, value)
        }
    }
}

// MARK: Collection parameters
public enum CollectionParameters: Parameters {
    case keys(list: String)
    case test(value: Int)
    case fields(name: String, value: String)
    case order(by: String, direction: StoringDirection)
    case page(value: Int)
    case pageSize(value: Int)
    case locale(value: String)
    case levels(value: Int)
    func getParam() -> (String, String) {
        switch self {
        case .keys(let list): return ("keys", list)
        case .test(let value): return ("test", String(value))
        case .fields(let name, let value): return ("fields." + name, value)
        case .order(let by, let direction): return ("order", direction.rawValue + by)
        case .page(let value): return ("page", String(value))
        case .pageSize(let value): return ("page_size", String(value))
        case .locale(let value): return ("locale", value)
        case .levels(let value): return ("levels", String(value))
        }
    }
}
