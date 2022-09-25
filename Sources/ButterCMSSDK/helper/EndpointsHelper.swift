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
        case get(slug: String, config: ButterCMSClientConfig, parameters: [AuthorParameters])
        case all(config: ButterCMSClientConfig, parameters: [AuthorParameters])

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

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .all(config, parameters),
                 let .get(_, config, parameters):
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters
            }
        }
    }

    internal enum Tags: URLRequestConvertible {
        case get(slug: String, config: ButterCMSClientConfig, parameters: [TagParameters])
        case all(config: ButterCMSClientConfig, parameters: [TagParameters])

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

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .get(_, config, parameters),
                 let .all(config, parameters):
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters
            }
        }
    }

    internal enum Feeds: URLRequestConvertible {
        case get(name: String, config: ButterCMSClientConfig, parameters: [FeedsParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/feeds"
            switch self {
            case .get(let name, _, _):
                return "\(base)/\(name)"
            }
        }

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .get(_, config, parameters):
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters
            }
        }
    }


    internal enum Posts: URLRequestConvertible {
        case get(slug: String, config: ButterCMSClientConfig)
        case search(config: ButterCMSClientConfig, parameters: [PostSearchParameters])
        case all(config: ButterCMSClientConfig, parameters: [PostsParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .search: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/posts"
            switch self {
            case .get(let slug, _):
                return "\(base)/\(slug)"
            case .search:
                return "\(base)/search"
            case .all:
                return "\(base)"
            }
        }

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .get(_, config):
                return [ApiKeyParameter(apiKey: config.apiKey)]
            case let .search(config, parameters):
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters
            case let .all(config, parameters):
                var defaultParams: [PostsParameters] = []
                if (!parameters.contains( where: { $0 == PostsParameters.preview(value: 1) || $0 == PostsParameters.preview(value: 0) }) && config.previewMode) {
                    defaultParams.append(PostsParameters.preview(value: 1))
                }
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters + defaultParams
            }
        }
    }

    internal enum Categories: URLRequestConvertible {
        case get(slug: String, config: ButterCMSClientConfig, parameters: [CategoryParameters])
        case all(config: ButterCMSClientConfig, parameters: [CategoryParameters])

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

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .get(_, config, parameters),
                 let .all(config, parameters):
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters
            }
        }
    }

    internal enum Pages: URLRequestConvertible {
        case get(pageType: String, slug: String, config: ButterCMSClientConfig, parameters: [PageParameters])
        case search(config: ButterCMSClientConfig, parameters: [PageSearchParameters])
        case all(pageType: String, config: ButterCMSClientConfig, parameters: [PagesParameters])

        func httpMethod() -> String {
            switch self {
            case .get: return "get"
            case .search: return "get"
            case .all: return "get"
            }
        }

        func endpoint() -> String {
            let base = "\(ButterConstats.SERVER_URL.rawValue)/pages"
            switch self {
            case .get(let pageType, let slug, _, _):
                return "\(base)/\(pageType)/\(slug)"
            case .search(_, _):
                return "\(base)/search"
            case .all(let pageType, _, _):
                return "\(base)/\(pageType)"
            }
        }

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .get(_, _, config, parameters):
                var defaultParams: [PageParameters] = []
                if (!parameters.contains( where: { $0 == PageParameters.preview(value: 1) || $0 == PageParameters.preview(value: 0) }) && config.previewMode) {
                    defaultParams.append(PageParameters.preview(value: 1))
                }
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters + defaultParams
            case let .search(config, parameters):
                var defaultParams: [PageSearchParameters] = []
                if (!parameters.contains( where: { $0 == PageSearchParameters.preview(value: 1) || $0 == PageSearchParameters.preview(value: 0) }) && config.previewMode) {
                    defaultParams.append(PageSearchParameters.preview(value: 1))
                }
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters + defaultParams
            case let .all(_, config, parameters):
                var defaultParams: [PagesParameters] = []
                if (!parameters.contains( where: { $0 == PagesParameters.preview(value: 1) || $0 == PagesParameters.preview(value: 0) }) && config.previewMode) {
                    defaultParams.append(PagesParameters.preview(value: 1))
                }
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters + defaultParams
            }
        }
    }

    internal enum Collections: URLRequestConvertible {
        case get(slug: String, config: ButterCMSClientConfig, parameters: [CollectionParameters])

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

        func urlParameters() -> [any Parameters] {
            switch self {
            case let .get(_, config, parameters):
                var defaultParams: [CollectionParameters] = []
                if (!parameters.contains( where: { $0 == CollectionParameters.preview(value: 1) || $0 == CollectionParameters.preview(value: 0) }) && config.previewMode) {
                    defaultParams.append(CollectionParameters.preview(value: 1))
                }
                return [ApiKeyParameter(apiKey: config.apiKey)] + parameters + defaultParams
            }
        }
    }
}

protocol URLRequestConvertible {
    func httpMethod() -> String
    func urlParameters() -> [any Parameters]
    func endpoint() -> String
    func getURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
    func url(parameters: [any Parameters]) throws -> URL {
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
