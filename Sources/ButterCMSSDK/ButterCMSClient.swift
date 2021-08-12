//
//  ButterCMSClient.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 05.08.2021.
//

import Foundation
@available(iOS 11.0, macOS 10.13, *)
public struct ButterCMSClient {
    var scheme = "https"
    var host = "api.buttercms.com"
    var authorsEndpoint = "/v2/authors"
    var categoriesEndpoint = "/categories"
    var pagesEndpoint = "/pages"
    var postsEndpoint = "/posts"
    var tagsEndpoint = "/tags"
    var contentEndpoint = "/content"
    var rssEndpoint = "/feeds/rss"
    var atomEndpoint = "/feeds/atom"
    var siteMapEndpoint = "/feeds/sitemap"
    var token = ""
    var urlSession = URLSession.shared
    private var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            var date = DateFormatter.iso8601withFractionalSeconds.date(from: string)
            if let d = date {
                return d
            } else {
                date = DateFormatter.iso8601.date(from: string)
                if let d = date {
                    return d
                } else {
                    throw DecodingError.dataCorruptedError(in: container,
                                                               debugDescription: "Invalid date: " + string)
                }
            }
        }
        return jsonDecoder
    }()

    func getAuthors(completion: @escaping (Result<AuthorsResponse, Error>) -> Void) {
        getRequest(endpoint: authorsEndpoint, completion: completion)
    }

    private func getRequest<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            var request = try prepareRequest(for: endpoint, with: ["auth_token": self.token])
            request.httpMethod = "GET"
            let task = urlSession.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    completion(.failure(ButterCMSError(error: .noDataReturned)))
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(ButterCMSError(error: .responseNotHTTPURLResponse)))
                    return
                }
                guard (200...299).contains(response.statusCode) else {
                    completion(.failure(ButterCMSError(error: .serverResponseNoOK(response.statusCode))))
                    return
                }
                do {
                    let object = try jsonDecoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(ButterCMSError(error: .canNotDecodeData(data))))
                }
            }
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }

    func prepareRequest(for endpoint: String, with parameters: [String: String]) throws -> URLRequest  {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = endpoint
        var urlQueryItems = [URLQueryItem]()
        for (name, value) in parameters {
            urlQueryItems.append(URLQueryItem(name: name, value: value))
        }
        components.queryItems = urlQueryItems
        guard let url = components.url else { throw ButterCMSError(error: .wrongURLComponent("scheme: \(scheme), host: \(host), endpoint: \(endpoint)"))}

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

}
