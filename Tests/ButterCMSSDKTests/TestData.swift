//
//  TestData.swift
//  Data for unit tests
//
//  Created by Martin Srb on 16.08.2021.
//

import Foundation
struct TestData {

    static let apiKey = "apiKey"

    static let authorUrl = "https://api.buttercms.com/v2/authors/martin-srb?"
                         + "include=recent_posts&"
                         + "auth_token=" + apiKey

    static let authorsUrl = "https://api.buttercms.com/v2/authors?"
                         + "include=recent_posts&"
                         + "auth_token=" + apiKey

    static let postUrl = "https://api.buttercms.com/v2/posts/the-post?"
                       + "auth_token=" + apiKey

    static let postsUrl = "https://api.buttercms.com/v2/posts?"
                        + "page=1&"
                        + "page_size=10&"
                        + "exclude_body=true&"
                        + "author_slug=authorSlug&"
                        + "category_slug=categorySlug&"
                        + "tag_slug=tagSlug&"
                        + "auth_token=" + apiKey

    static let postsSearchUrl = "https://api.buttercms.com/v2/search?"
                              + "query=query&"
                              + "page=1&"
                              + "page_size=10&"
                              + "auth_token=" + apiKey

    static let categoryUrl = "https://api.buttercms.com/v2/categories/category?"
                         + "include=recent_posts&"
                         + "auth_token=" + apiKey

    static let categoriesUrl = "https://api.buttercms.com/v2/categories?"
                         + "include=recent_posts&"
                         + "auth_token=" + apiKey

    static let tagUrl = "https://api.buttercms.com/v2/tags/tag?"
                         + "include=recent_posts&"
                         + "auth_token=" + apiKey

    static let tagsUrl = "https://api.buttercms.com/v2/tags?"
                         + "include=recent_posts&"
                         + "auth_token=" + apiKey

    static let pageUrl = "https://api.buttercms.com/v2/pages/pageType/page?"
                         + "locale=en&"
                         + "preview=1&"
                         + "levels=1&"
                         + "auth_token=" + apiKey

    static let pagesUrl = "https://api.buttercms.com/v2/pages/pageType?" 
                         + "locale=en&"
                         + "page=1&"
                         + "page_size=10&"
                         + "preview=1&"
                         + "levels=1&"
                         + "auth_token=" + apiKey

    static let collectionsUrl = "https://api.buttercms.com/v2/content/coll1?"
                        + "keys=key1,key2,key3&"
                        + "test=1&"
                        + "fields.field=value&"
                        + "order=-field&"
                        + "locale=en&"
                        + "page=1&"
                        + "page_size=10&"
                        + "levels=1&"
                        + "auth_token=" + apiKey

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
                "meta": {
                    "next_post": null,
                    "previous_post": {
                            "slug": "example-post",
                            "title": "Example Post",
                            "featured_image": "https://d2devwt40at1e2.cloudfront.net/api/file/tdt3s1OHRO6wfQOpmAHw"
                        }
                },
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
                },
                {
                    "status": "published",
                    "created": "2021-07-19T12:24:21.986359Z",
                    "updated": "2021-08-12T11:32:05.292096Z",
                    "published": "2021-07-19T12:24:00Z",
                    "title": "Example Post",
                    "slug": "example-post",
                    "body": "",
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

    static let posts2 = """
        {
            "meta": {
                "next_page": null,
                "previous_page": null,
                "count": 3
            },
            "data": [
                {
                    "status": "draft",
                    "created": "2021-08-23T08:01:11.574238Z",
                    "updated": "2021-08-23T08:01:11.672327Z",
                    "published": "2021-08-23T08:01:00Z",
                    "title": "TEST",
                    "slug": "test",
                    "summary": "",
                    "seo_title": "TEST",
                    "meta_description": "",
                    "featured_image_alt": "",
                    "url": "test",
                    "featured_image": null,
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
                    "created": "2021-08-04T20:30:54.234433Z",
                    "updated": "2021-08-17T20:02:25.646103Z",
                    "published": "2021-08-04T20:30:00Z",
                    "title": "Another example post",
                    "slug": "example-2",
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
                },
                {
                    "status": "published",
                    "created": "2021-07-19T12:24:21.986359Z",
                    "updated": "2021-08-12T11:32:05.292096Z",
                    "published": "2021-07-19T12:24:00Z",
                    "title": "Example Post",
                    "slug": "example-post",
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

    static let page = """
        {
            "data": {
                "slug": "test-slug",
                "name": "Test",
                "published": "2021-08-16T19:03:00.603407Z",
                "updated": "2021-08-16T19:03:00",
                "page_type": "testpagetype",
                "fields": {
                    "name": "Name field content"
                }
            }
        }
    """

    static let pages = """
     {
        "meta": {
            "next_page": null,
            "previous_page": null,
            "count": 2
        },
        "data": [
            {
                "slug": "test2-slug",
                "name": "Test2",
                "published": "2021-08-17T11:33:56.366994Z",
                "updated": "2021-08-17T11:33:56.366994Z",
                "page_type": "testpagetype",
                "fields": {
                    "name": "NAME OF THE GAME"
                }
            },
            {
                "slug": "test-slug",
                "name": "Test",
                "published": "2021-08-16T19:03:00.603407Z",
                "updated": "2021-08-17T11:27:44.135478Z",
                "page_type": "testpagetype",
                "fields": {
                    "name": "Name field content"
                }
            }
        ]
    }
    """
    static var collection =  """
     {
         "meta": {
             "count": 2,
             "next_page": null,
             "previous_page": null
         },
         "data": {
             "faq": [
                 {
                     "meta": {
                         "id": 143274
                     },
                     "question": "Can I Add Custom Fields to Blog Posts?",
                     "answer": "Need custom fields for your blog posts? Try Page Types to build a custom blog engine."
                 },
                 {
                     "meta": {
                         "id": 143273
                     },
                     "question": "Does Butter Provide Themes and Templates?",
                     "answer": "We do not provide templates or themes. We're SaaS so we host and maintain the CMS API and Dashboard. You query our Content API to pull content into your app. So we host and maintain the data, and you define your own custom content models within Butter."
                 }
             ]
         }
     }
    """
}
