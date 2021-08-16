//
//  TestData.swift
//  Data for unit tests
//
//  Created by Martin Srb on 16.08.2021.
//

import Foundation
struct TestData {
    static let author = """
        {
            "data": {
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
                }
        """

    static let authors = """
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
    
    static let post = """
                {
                "data":
                    {
                        "status": "published",
                        "created": "2021-08-04T20:30:54.234433Z",
                        "updated": "2021-08-12T11:31:23.247331Z",
                        "published": "2021-08-04T20:30:00Z",
                        "title": "Another example post",
                        "slug": "example-2",
                        "body": "",
                        "summary": "example",
                        "seo_title": "Example 2",
                        "meta_description": "example",
                        "featured_image_alt": "",
                        "url": "example-2",
                        "featured_image": "https://d2wzhk7xhrnk1x.cloudfront.net/f9Sen4QQcyVHSDZzI75w_butter-blog-post.jpg",
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
                    }
            }
        """

    static let posts = """
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

    static let category = """
        {
            "data":
                {
                    "name": "Example Category",
                    "slug": "example-category",
                    "recent_posts": [
                        {
                            "created": "2021-07-19T12:24:21.986359Z",
                            "published": "2021-07-19T12:24:00Z",
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
                            "body": "",
                            "summary": "This is an example blog post. Pretty neat huh?",
                            "updated": "2021-08-12T11:32:05.292096Z",
                            "seo_title": "Example Post SEO Optimized Title",
                            "meta_description": "This is our example blog posts SEO optimized meta description.",
                            "status": "published"
                        }
                    ]
             }
        }
    """

    static let categories = """
    {
        "data": [
            {
                "name": "Example Category",
                "slug": "example-category",
                "recent_posts": [
                    {
                        "created": "2021-07-19T12:24:21.986359Z",
                        "published": "2021-07-19T12:24:00Z",
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
                        "body": "",
                        "summary": "This is an example blog post. Pretty neat huh?",
                        "updated": "2021-08-12T11:32:05.292096Z",
                        "seo_title": "Example Post SEO Optimized Title",
                        "meta_description": "This is our example blog posts SEO optimized meta description.",
                        "status": "published"
                    }
                ]
            }
        ]
    }
    """

    static let tag = """
    {
        "data": {
                "name": "Example Tag",
                "slug": "example-tag",
                "recent_posts": [
                    {
                        "created": "2021-07-19T12:24:21.986359Z",
                        "published": "2021-07-19T12:24:00Z",
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
                        "body": "",
                        "summary": "This is an example blog post. Pretty neat huh?",
                        "updated": "2021-08-12T11:32:05.292096Z",
                        "seo_title": "Example Post SEO Optimized Title",
                        "meta_description": "This is our example blog posts SEO optimized meta description.",
                        "status": "published"
                    }
                ]
            }
    }
    """

    static let tags = """
    {
        "data": [
            {
                "name": "Example Tag",
                "slug": "example-tag",
                "recent_posts": [
                    {
                        "created": "2021-07-19T12:24:21.986359Z",
                        "published": "2021-07-19T12:24:00Z",
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
                        "body": "",
                        "summary": "This is an example blog post. Pretty neat huh?",
                        "updated": "2021-08-12T11:32:05.292096Z",
                        "seo_title": "Example Post SEO Optimized Title",
                        "meta_description": "This is our example blog posts SEO optimized meta description.",
                        "status": "published"
                    }
                ]
            }
        ]
    }
    """
}
