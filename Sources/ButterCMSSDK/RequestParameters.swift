//
//  RequestParameters.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 19.08.2021.
//

import Foundation

internal protocol Parameters: Equatable {
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
    case include(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .include(let value): return ("include", value)
        }
    }
}

public enum CategoryParameters: Parameters {
    case include(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .include(let value): return ("include", value)
        }
    }
}


public enum TagParameters: Parameters {
    case include(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .include(let value): return ("include", value)
        }
    }
}
public enum TagsParameters: Parameters {
    case include(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .include(let value): return ("include", value)
        }
    }
}

public enum PostsParameters: Parameters {
    case preview(value: Int)
    case page(value: Int)
    case pageSize(value: Int)
    case excludeBody
    case authorSlug(value: String)
    case categorySlug(value: String)
    case tagSlug(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .preview(let value): return ("preview", String(value))
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

public enum FeedsParameters: Parameters {
    case categorySlug(value: String)
    case tagSlug(value: String)
    func getParam() -> (String, String) {
        switch self {
        case .categorySlug(let value): return ("category_slug", value)
        case .tagSlug(let value): return ("tag_slug", value)
        }
    }
}

// MARK: Page parameters

public enum PageParameters: Parameters {
    case preview(value: Int)
    case locale(value: String)
    case levels(value: Int)
    func getParam() -> (String, String) {
        switch self {
        case .preview(let value): return ("preview", String(value))
        case .locale(let value): return ("locale", value)
        case .levels(let value): return ("levels", String(value))
        }
    }
}

public enum PagesParameters: Parameters {
    case preview(value: Int)
    case page(value: Int)
    case pageSize(value: Int)
    case locale(value: String)
    case levels(value: Int)
    case order(value:String)
    case fields(key: String, value: String)
    func getParam() -> (String, String) {
        switch self {
        case .preview(let value): return ("preview", String(value))
        case .page(let value): return ("page", String(value))
        case .pageSize(let value): return ("page_size", String(value))
        case .locale(let value): return ("locale", value)
        case .levels(let value): return ("levels", String(value))
        case .order(let value): return("order", value)
        case .fields(let key, let value): return ("fields." + key, value)
        }
    }
}

public enum PageSearchParameters: Parameters {
    case query(value: String)
    case pageType(value: String)
    case preview(value: Int)
    case page(value: Int)
    case pageSize(value: Int)
    case locale(value: String)
    case levels(value: Int)
    func getParam() -> (String, String) {
        switch self {
        case .query(let value): return ("query", value)
        case .pageType(let value): return ("page_type", value)
        case .preview(let value): return ("preview", String(value))
        case .page(let value): return ("page", String(value))
        case .pageSize(let value): return ("page_size", String(value))
        case .locale(let value): return ("locale", value)
        case .levels(let value): return ("levels", String(value))
        }
    }
}

// MARK: Collection parameters
public enum CollectionParameters: Parameters {
    case preview(value: Int)
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
        case .preview(let value): return ("preview", String(value))
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
