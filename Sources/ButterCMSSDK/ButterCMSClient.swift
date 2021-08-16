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
    var authorsEndpoint = "/authors"
    var categoryEndpoint = "/categories"
    var pagesEndpoint = "/pages"
    var postsEndpoint = "/posts"
    var tagsEndpoint = "/tags"
    var contentEndpoint = "/content"
    var rssEndpoint = "/feeds/rss"
    var atomEndpoint = "/feeds/atom"
    var siteMapEndpoint = "/feeds/sitemap"
    var apiVersion = "/v2"
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

    func getAuthor(with slag: String, completion: @escaping (Result<AuthorResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(authorsEndpoint)/\(slag)", with: nil, completion: completion)
    }

    func getAuthors(with parameters: [String: String]?, completion: @escaping (Result<AuthorsResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(authorsEndpoint)", with: parameters, completion: completion)
    }

    func getPost(with slag: String, completion: @escaping (Result<PostResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(postsEndpoint)/\(slag)", with: nil, completion: completion)
    }

    func getPosts(with parameters: [String: String]?, completion: @escaping (Result<PostsResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(postsEndpoint)", with: parameters, completion: completion)
    }

    func getCategory(with slag: String, completion: @escaping (Result<CategoryResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(categoryEndpoint)/\(slag)", with: nil, completion: completion)
    }

    func getTag(with slag: String, completion: @escaping (Result<TagResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(tagsEndpoint)/\(slag)", with: nil, completion: completion)
    }

    func getTags(with parameters: [String: String]?, completion: @escaping (Result<TagsResponse, Error>) -> Void) {
        getRequest(from: "\(apiVersion)/\(tagsEndpoint)", with: parameters, completion: completion)
    }

    private func getRequest<T: Decodable>(from endpoint: String, with parameters: [String: String]?,
                                          completion: @escaping (Result<T, Error>) -> Void) {
        do {
            var params = ["auth_token": self.token]
            if let parameters = parameters {
                params.merge(parameters){(_, new) in new }
            }
            var request = try prepareRequest(for: endpoint, with: params)
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
        components.queryItems =  parameters.map { (key, value) -> URLQueryItem in URLQueryItem(name: key, value: String(value))}
        guard let url = components.url else { throw ButterCMSError(error: .wrongURLComponent("scheme: \(scheme), host: \(host), endpoint: \(endpoint)"))}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

}
