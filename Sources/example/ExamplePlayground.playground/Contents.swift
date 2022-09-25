import PlaygroundSupport
import Foundation
import ButterCMSSDK

var butter = ButterCMSClient(apiKey: "3606556ecbd4134ea24b8936a829ab9edaddb583", previewMode: true)


butter.getTag(slug: "example-tag") { result in
    switch result {
    case .success(let tag):
        print(" --- getTag --- ")
        print("Tag: \(tag.data.name)")
        print(" --------------- ")
    case .failure(let error):
        print("getTag failed with Error: \(error)")
    }
}

butter.getTags(parameters: []) { result in
    switch result {
    case .success(let tags):
        print(" --- getTags --- ")
        tags.data.compactMap() { print("Tag: \($0.slug)") }
        print(" --------------- ")
    case .failure(let error):
        print("getTags failed with Error: \(error)")
    }
}

butter.getPosts(parameters: [
    .preview(value: 1),
    .excludeBody,
    .page(value: 1),
    .pageSize(value: 10)
            ]) { result in
    switch result {
    case .success(let posts):
        print(" --- getPosts --- ")
        print("Count: \(posts.meta.count)")
        posts.data.compactMap() { print("Post: \($0.title)") }
        print(" --------------- ")
    case .failure(let error):
        print("getPost failed with Error: \(error)")
    }
}

butter.searchPosts(parameters: [.query(value: "Butter")]) { result in
    switch result {
    case .success(let posts):
        print(" --- searchPosts --- ")
        print("Count: \(posts.meta.count)")
        posts.data.compactMap() { print("Post: \($0.title)") }
        print(" --------------- ")
    case .failure(let error):
        print("searchPosts failed with Error: \(error)")
    }
}

butter.getPost(slug: "example-post") { result in
    switch result {
    case .success(let post):
        print(" --- getPost --- ")
        print("Post: \(post.data.title)")
        print(" --------------- ")
    case .failure(let error):
        print("getPost failed with Error: \(error)")
    }
}

butter.getAuthor(slug: "applifting-sample") { result in
    switch result {
    case .success(let author):
        print(" --- getAuthor --- ")
        print("Author: \(author.data.slug)")
        print(" --------------- ")
    case .failure(let error):
        print("getAuthor failed with Error: \(error)")
    }
}

butter.getAuthors(parameters: [.include(value: "recent_posts")]) { result in
    switch result {
    case .success(let authors):
        print(" --- getAuthors --- ")
        authors.data.compactMap() { print("Author: \($0.slug)") }
        print(" --------------- ")
    case .failure(let error):
        print("getAuthor failed with Error: \(error)")
    }
}

butter.getCategory(slug: "example-category", parameters: [.include(value: "recent_posts")]) { result in
    switch result {
    case .success(let category):
        print(" --- getCategory --- ")
        print("Category: \(category.data.slug)")
        print(" --------------- ")
    case .failure(let error):
        print("getCategory failed with Error: \(error)")
    }
}

butter.getCategories(parameters: [.include(value: "recent_posts")]) { result in
    switch result {
    case .success(let categories):
        print(" --- getCategories --- ")
        categories.data.compactMap() { print("Categories: \($0.slug)") }
        print(" --------------- ")
    case .failure(let error):
        print("getCategories failed with Error: \(error)")
    }
}

private class FaqItem: CollectionItem {
    var meta: CollectionItemMeta
    var question: String = ""
    var answer: String = ""
}

butter.getCollection(slug: "faq", parameters: [.locale(value: "en")], type: FaqItem.self) { result in
    switch result {
    case .success(let collection):
        print(" --- getCollection --- ")
        collection.data.items.compactMap() { print("Question: \($0.answer)")}
        print(" --------------- ")
    case .failure(let error):
        print("getCollection failed with Error: \(error)")
    }
}

private struct PageFields: Codable {
    var name: String
    var description: String
}

butter.getPage(slug: "test-slug", parameters: [.locale(value: "en")], pageTypeSlug: "testpagetype", type: PageFields.self) { result in
    switch result {
    case .success(let page):
        print(" --- getPage --- ")
        print("Page: name=\(page.data.fields.name), description=\(page.data.fields.description)")
        print(" --------------- ")
    case .failure(let error):
        print("getPage failed with Error: \(error)")
    }
}

butter.getPages(parameters: [.locale(value: "en")], pageTypeSlug: "testpagetype", type: PageFields.self) { result in
    switch result {
    case .success(let pages):
        print(" --- getPages --- ")
        pages.data.compactMap() { print("Page: name=\($0.fields.name), descriptiomn=\($0.fields.description)")  }
        print(" --------------- ")
    case .failure(let error):
        print("getPages failed with Error: \(error)")
    }
}


private struct Hero: Codable {
    var firstname: String
    var lastname: String
}

private struct HeroePageFields: Codable {
    var hero: Hero
}

butter.getPages(parameters: [
                    .locale(value: "en"),
                    .preview(value: 1),
                    .fields(key: "hero.firstname", value: "Peter"),
                    .fields(key: "hero.lastname", value: "Pan"),
                    .levels(value: 1),
                    .order(value: "updated")
                    ], pageTypeSlug: "herotype", type: HeroePageFields.self) { result in
    switch result {
    case .success(let pages):
        print(" --- getPages --- ")
        pages.data.compactMap() { print("Page: First name=\($0.fields.hero.firstname), Last name=\($0.fields.hero.lastname)")  }
        print(" --------------- ")
    case .failure(let error):
        print("getPages failed with Error: \(error)")
    }
}

butter.previewMode = true

private struct CaseStudyPageFields: Codable {
    var title: String
    var content: String
    var industry: String
    var subindustry: String
    var featuredImage: String
    var reviewer: String
    var studyDate: Date
}

butter.searchPages(parameters: [
                            .query(value: "Automotive"),
                            .pageType(value: "case_studies"),
                            .locale(value: "en"),
                            .page(value: 1),
                            .pageSize(value: 10)
                            ], type: CaseStudyPageFields.self) { result in
                                    switch result {
                                    case .success(let pages):
                                        print(" --- searchPages --- ")
                                        pages.data.compactMap() { print($0) }
                                        print(" --------------- ")
                                    case .failure(let error):
                                        print("searchPages failed with Error: \(error)")
                                    }
}

butter.getFeeds(name: "rss") { result in
    switch result {
    case .success(let feeds):
        print(" --- getFeed --- ")
        print(feeds.data)
        print(" --------------- ")
    case .failure(let error):
        print("searchPages failed with Error: \(error)")
    }
}
