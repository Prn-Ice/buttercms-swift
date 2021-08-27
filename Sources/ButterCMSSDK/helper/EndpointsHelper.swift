//
//  EndpointsHelper.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 19.08.2021.
//
import Foundation
@available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)
extension ButterCMSClient {
    
    internal enum Authors: URLRequestConvertible {
        case get(slug: String, apiKey: String, parameters: [AuthorParameters])
        case all(apiKey: String, parameters: [AuthorParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/authors"
            switch self {
            case .get(let slug, _, _):
                return "\(base)/\(slug)"
            case .all:
                return "\(base)"
            }
        }

        func urlParameters() -> [Parameters] {
            switch self {
            case let .all(apiKey, parameters),
                 let .get(_, apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            }
        }
    }

    internal enum Tags: URLRequestConvertible {
        case get(slug: String, apiKey: String, parameters: [TagParameters])
        case all(apiKey: String, parameters: [TagParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/tags"
            switch self {
            case .get(let slug, _, _):
                return "\(base)/\(slug)"
            case .all:
                return "\(base)"
            }
        }

        func urlParameters() -> [Parameters] {
            switch self {
            case let .get(_, apiKey, parameters),
                 let .all(apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            }
        }
    }

    internal enum Posts: URLRequestConvertible {
        case get(slug: String, apiKey: String)
        case search(apiKey: String, parameters: [PostSearchParameters])
        case all(apiKey: String, parameters: [PostsParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .search: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)"
            switch self {
            case .get(let slug, _):
                return "\(base)/posts/\(slug)"
            case .search:
                return "\(base)/search"
            case .all:
                return "\(base)/posts"
            }
        }

        func urlParameters() -> [Parameters] {
            switch self {
            case let .get(_, apiKey):
                return [ApiKeyParameter(apiKey: apiKey)]
            case let .search(apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            case let .all(apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            }
        }
    }

    internal enum Categories: URLRequestConvertible {
        case get(slug: String, apiKey: String, parameters: [CategoryParameters])
        case all(apiKey: String, parameters: [CategoryParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/categories"
            switch self {
            case .get(let slug, _, _):
                return "\(base)/\(slug)"
            case .all:
                return "\(base)"
            }
        }

        func urlParameters() -> [Parameters] {
            switch self {
            case let .get(_, apiKey, parameters),
                 let .all(apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            }
        }
    }

    internal enum Pages: URLRequestConvertible {
        case get(pageType: String, slug: String, apiKey: String, parameters: [PageParameters])
        case all(pageType: String, apiKey: String, parameters: [PagesParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/pages"
            switch self {
            case .get(let pageType, let slug, _, _):
                return "\(base)/\(pageType)/\(slug)"
            case .all(let pageType, _, _):
                return "\(base)/\(pageType)"
            }
        }

        func urlParameters() -> [Parameters] {
            switch self {
            case let .get(_, _, apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            case let .all(_, apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            }
        }
    }

    internal enum Collections: URLRequestConvertible {
        case get(slug: String, apiKey: String, parameters: [CollectionParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/content"
            switch self {
            case .get(let slug, _, _):
                return "\(base)/\(slug)"
            }
        }

        func urlParameters() -> [Parameters] {
            switch self {
            case let .get(_, apiKey, parameters):
                return [ApiKeyParameter(apiKey: apiKey)] + parameters
            }
        }
    }
}

protocol URLRequestConvertible {
    func httpMethod() -> String
    func urlParameters() -> [Parameters]
    func endpoint() -> String
    func getURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
    func url(parameters: [Parameters]) throws -> URL {
        guard var components = URLComponents(string: self.endpoint()) else { throw ButterCMSError(error: .canNotConstructUrl)}
        let params = Dictionary(uniqueKeysWithValues: parameters.compactMap { return $0.getParam() })
        components.queryItems = params.map { (key, value) -> URLQueryItem in URLQueryItem(name: key, value: String(value))}
        guard let url = components.url else { throw ButterCMSError(error: .canNotConstructUrl) }
        return url
    }

    func getURLRequest() throws -> URLRequest {
        let url = try self.url(parameters: self.urlParameters())
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod()
        return request
    }
}
