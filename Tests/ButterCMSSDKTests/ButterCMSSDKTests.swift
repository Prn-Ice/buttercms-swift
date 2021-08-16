import XCTest
import Foundation

@testable import ButterCMSSDK

@available(iOS 11.0, macOS 10.13, *)
final class ButterCMSSDKTests: XCTestCase {
        var urlSession: URLSession!
        var uut: ButterCMSClient!

        let jsonDecoder = JSONDecoder()

        override func setUpWithError() throws {
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            jsonDecoder.dateDecodingStrategy = .custom { decoder in
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                var date = DateFormatter.iso8601withFractionalSeconds.date(from: string)
                if date == nil {
                    date = DateFormatter.iso8601.date(from: string)
                }
                if let date = date {
                    return date
                } else {
                    throw DecodingError.dataCorruptedError(in: container,
                                                           debugDescription: "Invalid date: " + string)
                }
            }
            let configuration = URLSessionConfiguration.ephemeral
                    configuration.protocolClasses = [MockURLProtocol.self]
                    urlSession = URLSession(configuration: configuration)
            uut = ButterCMSClient()
            uut.urlSession = URLSession(configuration: configuration)
            uut.token = "the token"
        }

        func testPost() {
            let expectation = XCTestExpectation(description: "API expectation")
            MockURLProtocol.requestHandler = { _ in
            // Given mock data
                guard let data = TestData.post.data(using: .utf8) else {
                    throw MockURLProtocolError.canNotParse("Incorrect mock json data")
                }
                return ((HTTPURLResponse(), data))
            }
            // When
            uut.getPost(with: "slag") { result in
                switch result {
                case .success(let object):
            // Then
                XCTAssertNotNil(object, "Received nil from getPost")
                case .failure(let error):
                    XCTFail("getPost fialed with Error: \(error)")
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 1.0)
        }

        func testPosts() {
            let expectation = XCTestExpectation(description: "API expectation")
            MockURLProtocol.requestHandler = { _ in
            // Given mock data
                guard let data = TestData.posts.data(using: .utf8) else {
                    throw MockURLProtocolError.canNotParse("Incorrect mock json data")
                }
                return ((HTTPURLResponse(), data))
            }
            // When
            uut.getPosts(with: nil) { result in
                switch result {
                case .success(let object):
            // Then
                XCTAssertNotNil(object, "Received nil from getPosts")
                XCTAssertTrue(object.data.count > 0, "Receved no posts")
                case .failure(let error):
                    XCTFail("getPosts fialed with Error: \(error)")
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 1.0)
        }

    func testAuthor() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
        // Given mock data
            guard let data = TestData.author.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getAuthor(with: "slag") { result in
            switch result {
            case .success(let object):
        // Then
            XCTAssertNotNil(object, "Received nil from getAuthor")
            case .failure(let error):
                XCTFail("getAuthor fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testAuthors() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
        // Given mock data
            guard let data = TestData.authors.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getAuthors(with: nil) { result in
            switch result {
            case .success(let objects):
        // Then
            XCTAssertNotNil(objects, "Received nil from getAuthors")
                XCTAssertTrue(objects.data.count > 0, "Receved no authors")
            case .failure(let error):
                XCTFail("getAuthors fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testCategory() {
        let expectation = XCTestExpectation(description: "API expectation")
        // Given mock data
        MockURLProtocol.requestHandler = { _ in
            guard let data = TestData.category.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getCategory(with: "slag") { result in
            switch result {
            case .success(let object):
        // Then
            XCTAssertNotNil(object, "Received nil from getCategory")
            case .failure(let error):
                XCTFail("getCategory fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testTag() {
        let expectation = XCTestExpectation(description: "API expectation")
        // Given mock data
        MockURLProtocol.requestHandler = { _ in
            guard let data = TestData.tag.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getTag(with: "slag") { result in
            switch result {
            case .success(let object):
        // Then
            XCTAssertNotNil(object, "Received nil from getTag")
            case .failure(let error):
                XCTFail("getCategory fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testTags() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
        // Given mock data
            guard let data = TestData.tags.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getTags(with: nil) { result in
            switch result {
            case .success(let objects):
        // Then
            XCTAssertNotNil(objects, "Received nil from getTags")
                XCTAssertTrue(objects.data.count > 0, "Receved no authors")
            case .failure(let error):
                XCTFail("getTags fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
