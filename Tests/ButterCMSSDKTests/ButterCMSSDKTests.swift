import XCTest
import Foundation

@testable import ButterCMSSDK

@available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)
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
        uut = ButterCMSClient(apiKey: TestData.apiKey, urlSession: URLSession(configuration: configuration))
    }

    // MARK: Authors

    func testAuthorUrl() throws {
        // Given
        let params: [AuthorParameters] = [.include(value: "recent_posts")]
        let slug = "martin-srb"

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.authorUrl),
              let url = try ButterCMSClient.Authors.get(slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testAuthorsUrl() throws {
        // Given
        let params: [AuthorParameters] = [.include(value: "recent_posts")]
        // When
        guard let expectedUrlComp = URLComponents(string: TestData.authorsUrl),
              let url = try ButterCMSClient.Authors.all(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
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
        uut.getAuthor(slug: "slug", parameters: [.include(value: "recent_posts")]) { result in
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
        uut.getAuthors(parameters: [.include(value: "recent_posts")]) { result in
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

    // MARK: Posts

    func testPostUrl() throws {
        // Given
        let slug = "the-post"

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.postUrl),
              let url = try ButterCMSClient.Posts.get(slug: slug, config: uut).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testAllPostsUrl() throws {
        // Given
        let params: [PostsParameters] = [
            .page(value: 1),
            .pageSize(value: 10),
            .excludeBody,
            .authorSlug(value: "authorSlug"),
            .categorySlug(value: "categorySlug"),
            .tagSlug(value: "tagSlug")]

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.allPostsUrl),
              let url = try ButterCMSClient.Posts.all(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testAllPostsUrlWithDefaultPreviewTrue() throws {
        // Given
        let params: [PostsParameters] = [
            .page(value: 1),
            .pageSize(value: 10),
            .excludeBody,
            .authorSlug(value: "authorSlug"),
            .categorySlug(value: "categorySlug"),
            .tagSlug(value: "tagSlug")]

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.allPostsUrlWithDefaultPreviewTrue),
              let url = try ButterCMSClient.Posts.all(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testAllPostsUrlWithOverwritenDefaultPreviewTrue() throws {
        // Given
        let params: [PostsParameters] = [
            .preview(value: 0),
            .page(value: 1),
            .pageSize(value: 10),
            .excludeBody,
            .authorSlug(value: "authorSlug"),
            .categorySlug(value: "categorySlug"),
            .tagSlug(value: "tagSlug")]

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.allPostsUrlOverwritenWithDefaultPreviewTrue),
              let url = try ButterCMSClient.Posts.all(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testSearchPostUrl() throws {
        // Given
        let params: [PostSearchParameters] = [
            .query(value: "query"),
            .page(value: 1),
            .pageSize(value: 10)]

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.postsSearchUrl),
              let url = try ButterCMSClient.Posts.search(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
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
        uut.getPost(slug: "slug") { result in
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
            guard let data = TestData.posts2.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getPosts(parameters:
                        [   .preview(value: 1),
                            .page(value: 1),
                            .pageSize(value: 10),
                            .excludeBody,
                            .authorSlug(value: "authorSlug"),
                            .categorySlug(value: "categorySlug"),
                            .tagSlug(value: "tagSlug")
                        ]) { result in
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

    func testPostSearch() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
            // Given mock data
            guard let data = TestData.posts.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.searchPosts(parameters:
                            [   .query(value: "querystring"),
                                .page(value: 1),
                                .pageSize(value: 10)
                            ]) { result in
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

    // MARK: Category

    func testCategoryUrl() throws {
        // Given
        let params: [CategoryParameters] = [.include(value: "recent_posts")]
        let slug = "category"

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.categoryUrl),
              let url = try ButterCMSClient.Categories.get(slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testCategoriesUrl() throws {
        // Given
        let params: [CategoryParameters] = [.include(value: "recent_posts")]
        // When
        guard let expectedUrlComp = URLComponents(string: TestData.categoriesUrl),
              let url = try ButterCMSClient.Categories.all(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
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
        uut.getCategory(slug: "slug", parameters: [.include(value: "recent_posts")]) { result in
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

    func testCategories() {
        let expectation = XCTestExpectation(description: "API expectation")
        // Given mock data
        MockURLProtocol.requestHandler = { _ in
            guard let data = TestData.categories.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getCategories(parameters: [.include(value: "recent_posts")]) { result in
            switch result {
            case .success(let object):
                // Then
                XCTAssertNotNil(object, "Received nil from getCategory")
            case .failure(let error):
                XCTFail("getCategories fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }


    // MARK: Tags

    func testTagUrl() throws {
        // Given
        let params: [TagParameters] = [.include(value: "recent_posts")]
        let slug = "tag"

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.tagUrl),
              let url = try ButterCMSClient.Tags.get(slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testTagssUrl() throws {
        // Given
        let params: [TagParameters] = [.include(value: "recent_posts")]
        // When
        guard let expectedUrlComp = URLComponents(string: TestData.tagsUrl),
              let url = try ButterCMSClient.Tags.all(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
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
        uut.getTag(slug: "slug", parameters: [.include(value: "recent_posts")]) { result in
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
        uut.getTags(parameters: [.include(value: "recent_posts")]) { result in
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



    // MARK: Feeds
    func testFeedsUrl() throws {
        // Given
        let params: [FeedsParameters] = [
                .categorySlug(value: "catSlug"),
                .tagSlug(value: "tagSlug")
        ]
        // When
        guard let expectedUrlComp = URLComponents(string: TestData.feedsUrl),
              let url = try ButterCMSClient.Feeds.get(name: "rss", config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testRssFeeds() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
            // Given mock data
            guard let data = TestData.rssFeeds.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getFeeds(name: "rss", parameters: [.categorySlug(value: "catSlug"), .tagSlug(value: "tagSLug")]) { result in
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

    // MARK: Pages

    func testGetPagesUrl() throws {
        // Given
        let params: [PageParameters] = [
            .levels(value: 1),
            .locale(value: "en"),
            .preview(value: 1)]
        let slug = "page"

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.getPagesUrl),
              let url = try ButterCMSClient.Pages.get(pageType: "pageType", slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testGetPagesUrlWithDefaultPreviewTrue() throws {
        // Given
        let params: [PageParameters] = [
            .levels(value: 1),
            .locale(value: "en"),
            .preview(value: 1)]
        let slug = "page"

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.getPagesUrlWithDefaultPreviewmodeTrue),
              let url = try ButterCMSClient.Pages.get(pageType: "pageType", slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testGetPagesUrlWithOverwritenDefaultPreviewTrue() throws {
        // Given
        let params: [PageParameters] = [
            .preview(value: 0),
            .levels(value: 1),
            .locale(value: "en")]
        let slug = "page"

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.getPagesUrlWithOvervritenDefaultPreviewmodeTrue),
              let url = try ButterCMSClient.Pages.get(pageType: "pageType", slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testSearchPagesUrl() throws {
        // Given
        let params: [PageSearchParameters] = [
            .query(value: "buttercms"),
            .pageType(value: "page_type"),
            .page(value: 1),
            .pageSize(value: 10),
            .levels(value: 1),
            .locale(value: "en"),
            .preview(value: 1)]

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.searchPagesUrl),
              let url = try ButterCMSClient.Pages.search(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testSearchPagesUrlWithDefaultPreviewTrue() throws {
        // Given
        let params: [PageSearchParameters] = [
            .query(value: "buttercms"),
            .pageType(value: "page_type"),
            .page(value: 1),
            .pageSize(value: 10),
            .levels(value: 1),
            .locale(value: "en")]

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.searchPagesUrlWithDefaultPreviewmodeTrue),
              let url = try ButterCMSClient.Pages.search(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testSearchPagesUrlWithOverwritenDefaultPreviewTrue() throws {
        // Given
        let params: [PageSearchParameters] = [
            .query(value: "buttercms"),
            .pageType(value: "page_type"),
            .page(value: 1),
            .preview(value: 0),
            .pageSize(value: 10),
            .levels(value: 1),
            .locale(value: "en")]

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.searchPagesUrlWithOvervritenDefaultPreviewmodeTrue),
              let url = try ButterCMSClient.Pages.search(config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }
    ///
    func testAllPagesUrl() throws {
        // Given
        let params: [PagesParameters] = [
            .page(value: 1),
            .pageSize(value: 10),
            .levels(value: 1),
            .locale(value: "en"),
            .order(value: "published"),
            .fields(key: "hero.firstName", value: "Barbar"),
            .fields(key: "hero.lastName", value: "Conan"),
            .preview(value: 1)]

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.allPagesUrl),
              let url = try ButterCMSClient.Pages.all(pageType: "pageType", config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testAllPagesUrlWithDefaultPreviewTrue() throws {
        // Given
        let params: [PagesParameters] = [
            .page(value: 1),
            .pageSize(value: 10),
            .levels(value: 1),
            .locale(value: "en"),
            .order(value: "published"),
            .fields(key: "hero.firstName", value: "Barbar"),
            .fields(key: "hero.lastName", value: "Conan")]
        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.allPagesUrlUrlWithDefaultPreviewmodeTrue),
              let url = try ButterCMSClient.Pages.all(pageType: "pageType", config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testAllPagesUrlWithOverwritenDefaultPreviewTrue() throws {
        // Given
        let params: [PagesParameters] = [
            .page(value: 1),
            .preview(value: 0),
            .pageSize(value: 10),
            .levels(value: 1),
            .locale(value: "en"),
            .order(value: "published"),
            .fields(key: "hero.firstName", value: "Barbar"),
            .fields(key: "hero.lastName", value: "Conan")]

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.allPagesUrlUrlWithOverwritenDefaultPreviewmodeTrue),
              let url = try ButterCMSClient.Pages.all(pageType: "pageType", config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    ///


    func testPage() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
            // Given mock data
            guard let data = TestData.page.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getPage(slug: "test-slug",
                    parameters: [
                        .preview(value: 1),
                        .locale(value: "en"),
                        .levels(value: 2)
                    ],
                    pageTypeSlug: "test", type: PageFields.self) { result in
            switch result {
            case .success(let objects):
                // Then
                XCTAssertNotNil(objects, "Received nil from getPage")
                XCTAssertEqual(objects.data.fields.name, "Name field content", "Page filed name does not contain expected data")
            case .failure(let error):
                XCTFail("getPage fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testPages() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
            // Given mock data
            guard let data = TestData.pages.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getPages(parameters: [
            .preview(value: 1),
            .page(value: 1),
            .pageSize(value: 10),
            .locale(value: "en"),
            .levels(value: 2)
        ], pageTypeSlug: "testPage", type: PageFields.self) { result in
            switch result {
            case .success(let objects):
                // Then
                XCTAssertNotNil(objects, "Received nil from getPage")
                XCTAssertTrue(objects.data.count > 0, "Receved no authors")
            case .failure(let error):
                XCTFail("getPage fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: Collections

    func testGetCollectionUrl() throws {
        // Given
        let params: [CollectionParameters] = [
            .preview(value: 1),
            .keys(list: "key1,key2,key3"),
            .test(value: 1),
            .fields(name: "field", value: "value"),
            .order(by: "field", direction: .desc),
            .page(value: 1),
            .pageSize(value: 10),
            .locale(value: "en"),
            .levels(value: 1)
        ]
        let slug = "coll1"

        // When
        guard let expectedUrlComp = URLComponents(string: TestData.getCollectionsUrl),
              let url = try ButterCMSClient.Collections.get(slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testGetCollectionUrlWithDefaultPreviewTrue() throws {
        // Given
        let params: [CollectionParameters] = [
            .keys(list: "key1,key2,key3"),
            .test(value: 1),
            .fields(name: "field", value: "value"),
            .order(by: "field", direction: .desc),
            .page(value: 1),
            .pageSize(value: 10),
            .locale(value: "en"),
            .levels(value: 1)
        ]
        let slug = "coll1"

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.getCollectionsUrlWithDefaultPreviewTrue),
              let url = try ButterCMSClient.Collections.get(slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testGetCollectionUrlWithOverwritenDefaultPreviewTrue() throws {
        // Given
        let params: [CollectionParameters] = [
            .preview(value: 0),
            .keys(list: "key1,key2,key3"),
            .test(value: 1),
            .fields(name: "field", value: "value"),
            .order(by: "field", direction: .desc),
            .page(value: 1),
            .pageSize(value: 10),
            .locale(value: "en"),
            .levels(value: 1)
        ]
        let slug = "coll1"

        // When
        uut.previewMode = true
        guard let expectedUrlComp = URLComponents(string: TestData.getCollectionsUrlWithOverwritenDefaultPreviewTrue),
              let url = try ButterCMSClient.Collections.get(slug: slug, config: uut, parameters: params).getURLRequest().url,
              let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Wrong test data")
            return
        }
        // Then
        XCTAssertTrue(expectedUrlComp.isEqual(rhs: urlComp), "URL is not as expected")
    }

    func testCollection() {
        let expectation = XCTestExpectation(description: "API expectation")
        MockURLProtocol.requestHandler = { _ in
            // Given mock data
            guard let data = TestData.collection.data(using: .utf8) else {
                throw MockURLProtocolError.canNotParse("Incorrect mock json data")
            }
            return ((HTTPURLResponse(), data))
        }
        // When
        uut.getCollection(slug: "fag", parameters: [
            .keys(list: "key1,key2,key3"),
            .test(value: 1),
            .fields(name: "field", value: "value"),
            .order(by: "field", direction: .desc),
            .page(value: 1),
            .pageSize(value: 10),
            .locale(value: "en"),
            .levels(value: 1)
        ], type: FaqItem.self ) { result in
            switch result {
            case .success(let objects):
                // Then
                XCTAssertNotNil(objects, "Received nil from getCollection")
            case .failure(let error):
                XCTFail("getCollection fialed with Error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

private struct PageFields: Codable {
    var name: String
}

private class FaqItem: CollectionItem {
    var meta: CollectionItemMeta
    var question: String = ""
    var answer: String = ""
}
