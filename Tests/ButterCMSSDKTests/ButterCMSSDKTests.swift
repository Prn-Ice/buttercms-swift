    import XCTest
    @testable import ButterCMSSDK

    @available(iOS 11.0, macOS 10.13, *)
    final class ButterCMSSDKTests: XCTestCase {
        let jsonDecoder = JSONDecoder()

        let authors = """
                {
                    "data": [
                        {
                            "first_name": "Applifting",
                            "last_name": "Sample",
                            "email": "martin.srb@applifting.io",
                            "slug": "applifting-sample",
                            "bio": "My bio",
                            "title": "Managing Partner, Solution Architect",
                            "linkedin_url": "https://www.linkedin.com/in/martin-srb-applifting/",
                            "facebook_url": "",
                            "instagram_url": "",
                            "pinterest_url": "",
                            "twitter_handle": "",
                            "profile_image": "",
                            "recent_posts": [
                                {
                                    "created": "2021-07-19T12:24:21.986359Z",
                                    "published": "2021-07-19T12:24:21.985221Z",
                                    "url": "example-post",
                                    "slug": "example-post",
                                    "featured_image": "https://d2devwt40at1e2.cloudfront.net/api/file/tdt3s1OHRO6wfQOpmAHw",
                                    "featured_image_alt": "",
                                    "author": {
                                        "first_name": "Applifting",
                                        "last_name": "Sample",
                                        "email": "martin.srb@applifting.io",
                                        "slug": "applifting-sample",
                                        "bio": "My bio",
                                        "title": "Managing Partner, Solution Architect",
                                        "linkedin_url": "https://www.linkedin.com/in/martin-srb-applifting/",
                                        "facebook_url": "",
                                        "instagram_url": "",
                                        "pinterest_url": "",
                                        "twitter_handle": "",
                                        "profile_image": ""
                                    },
                                    "tags": [
                                        {
                                            "name": "Example Tag",
                                            "slug": "example-tag"
                                        }
                                    ],
                                    "categories": [
                                        {
                                            "name": "Example Category",
                                            "slug": "example-category"
                                        }
                                    ],
                                    "title": "Example Post",
                                    "body": "Body",
                                    "summary": "This is an example blog post. Pretty neat huh?",
                                    "updated": "2021-07-19T12:24:22.072388Z",
                                    "seo_title": "Example Post SEO Optimized Title",
                                    "meta_description": "This is our example blog posts SEO optimized meta description.",
                                    "status": "published"
                                }
                            ]
                        }
                    ]
                }
            """

        let posts = """
            {
                "meta": {
                    "next_page": null,
                    "previous_page": null,
                    "count": 2
                },
                "data": [
                    {
                        "status": "published",
                        "created": "2021-08-04T20:30:54.234433Z",
                        "updated": "2021-08-04T20:31:43.281417Z",
                        "published": "2021-08-04T20:30:00.000000Z",
                        "title": "Example 2",
                        "slug": "example-2",
                        "body": "Body",
                        "summary": "example",
                        "seo_title": "Example 2",
                        "meta_description": "example",
                        "featured_image_alt": "",
                        "url": "example-2",
                        "featured_image": "https://cdn.buttercms.com/y5Of36JES8YLTqTuP7ig",
                        "author": {
                            "bio": "My bio",
                            "slug": "applifting-sample",
                            "email": "martin.srb@applifting.io",
                            "title": "Managing Partner, Solution Architect",
                            "last_name": "Sample",
                            "first_name": "Applifting",
                            "facebook_url": "",
                            "linkedin_url": "https://www.linkedin.com/in/martin-srb-applifting/",
                            "instagram_url": "",
                            "pinterest_url": "",
                            "profile_image": "",
                            "twitter_handle": ""
                        },
                        "tags": [],
                        "categories": []
                    },
                    {
                        "status": "published",
                        "created": "2021-07-19T12:24:21.986359Z",
                        "updated": "2021-07-19T12:24:22.072388Z",
                        "published": "2021-07-19T12:24:21.985221Z",
                        "title": "Example Post",
                        "slug": "example-post",
                        "body": "Body",
                        "summary": "This is an example blog post. Pretty neat huh?",
                        "seo_title": "Example Post SEO Optimized Title",
                        "meta_description": "This is our example blog posts SEO optimized meta description.",
                        "featured_image_alt": "",
                        "url": "example-post",
                        "featured_image": "https://d2devwt40at1e2.cloudfront.net/api/file/tdt3s1OHRO6wfQOpmAHw",
                        "author": {
                            "bio": "My bio",
                            "slug": "applifting-sample",
                            "email": "martin.srb@applifting.io",
                            "title": "Managing Partner, Solution Architect",
                            "last_name": "Sample",
                            "first_name": "Applifting",
                            "facebook_url": "",
                            "linkedin_url": "https://www.linkedin.com/in/martin-srb-applifting/",
                            "instagram_url": "",
                            "pinterest_url": "",
                            "profile_image": "",
                            "twitter_handle": ""
                        },
                        "tags": [
                            {
                                "name": "Example Tag",
                                "slug": "example-tag"
                            }
                        ],
                        "categories": [
                            {
                                "name": "Example Category",
                                "slug": "example-category"
                            }
                        ]
                    }
                ]
            }
        """

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
                }
                else {
                    throw DecodingError.dataCorruptedError(in: container,
                                                           debugDescription: "Invalid date: " + string)
                }
            }
        }

        func testAuthors() {

            guard let data = authors.data(using: .utf8) else {
                XCTFail("Can not execute test")
                return
            }
            do {
                try jsonDecoder.decode(AuthorsResponse.self, from: data)
            } catch {
                XCTFail(" Cannot decode Authors from json: \(error) ")
            }
        }

        func testPost() {
            guard let data = posts.data(using: .utf8) else {
                XCTFail("Can not execute test")
                return
            }
            do {
                try jsonDecoder.decode(PostsResponse.self, from: data)
            } catch {
                XCTFail(" Cannot decode Posts from json: \(error) ")
            }
        }

        func testAuthorsCall() {
            let expectation = XCTestExpectation(description: "Get Authors")
            var butter = ButterCMSClient()
            butter.token = "3606556ecbd4134ea24b8936a829ab9edaddb583"
            butter.getAuthors() { result in
                switch result {
                case .success(let authors):
                    print (" --- Authors ----")
                    print("\(authors.data.count)")
                    for a in authors.data {
                        print("\(a.firstName)")
                    }
                case .failure(let error):
                    print("\(error)")
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        }
    }
