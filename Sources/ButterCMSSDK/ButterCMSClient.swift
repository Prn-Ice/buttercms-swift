//
//  ButterCMSClient.swift
//  ButterCMSSDK
//
//  Created by Martin Srb on 05.08.2021.
//

import Foundation
@available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)
public struct ButterCMSClient {
    
    let apiKey: String
    let urlSession: URLSession
    private var jsonDecoder = JSONDecoder()
    
    public init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let date = DateFormatter.iso8601withFractionalSeconds.date(from: string) ??
                DateFormatter.iso8601.date(from: string) {
                return date
            } else {
                throw DecodingError.dataCorruptedError( in: container, debugDescription: "Invalid date: " + string)
            }
        }
    }
    
    public func getAuthor(slug: String, parameters: [AuthorParameters] = [], completion: @escaping (Result<AuthorResponse, Error>) -> Void) {
        let endpoint = Authors.get(slug: slug, apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getAuthors(parameters: [AuthorParameters] = [], completion: @escaping (Result<AuthorsResponse, Error>) -> Void) {
        let endpoint = Authors.all(apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getPost(slug: String, completion: @escaping (Result<PostResponse, Error>) -> Void) {
        let endpoint = Posts.get(slug: slug, apiKey: apiKey)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getPosts(parameters: [PostsParameters] = [], completion: @escaping (Result<PostsResponse, Error>) -> Void) {
        let endpoint = Posts.all(apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func searchPosts(parameters: [PostSearchParameters] = [], completion: @escaping (Result<PostsResponse, Error>) -> Void) {
        let endpoint = Posts.search(apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }

    public func getCategory(slug: String, parameters: [CategoryParameters] = [], completion: @escaping (Result<CategoryResponse, Error>) -> Void) {
        let endpoint = Categories.get(slug: slug, apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getCategories(parameters: [CategoryParameters] = [], completion: @escaping (Result<CategoryResponse, Error>) -> Void) {
        let endpoint = Categories.all(apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getTag(slug: String, parameters: [TagParameters] = [], completion: @escaping (Result<TagResponse, Error>) -> Void) {
        let endpoint = Tags.get(slug: slug, apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getTags(parameters: [TagParameters] = [], completion: @escaping (Result<TagsResponse, Error>) -> Void) {
        let endpoint = Tags.all(apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }

    public func getPage<T: Decodable>(slug: String, parameters: [PageParameters] = [], pageTypeSlug: String, type: T.Type, completion: @escaping (Result<PageResponse<T>, Error>) -> Void) {
        let endpoint = Pages.get(pageType: pageTypeSlug, slug: slug, apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getPages<T: Decodable>(parameters: [PagesParameters] = [], pageTypeSlug: String, type: T.Type, completion: @escaping (Result<PagesResponse<T>, Error>) -> Void) {
        let endpoint = Pages.all(pageType: pageTypeSlug, apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    public func getCollection<T: Decodable>(slug: String, parameters: [CollectionParameters] = [], type: T.Type, completion: @escaping (Result<CollectionResponse<T>, Error>) -> Void) {
        let endpoint = Collections.get(slug: slug, apiKey: apiKey, parameters: parameters)
        processRequest(endpoint: endpoint, completion: completion)
    }
    
    private func processRequest<T: Decodable>(endpoint: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let request = try endpoint.getURLRequest()
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
}

internal enum ButterConstats: String {
    case SERVER_URL = "https://api.buttercms.com/v2"
}
