# ButterCMSSDK

ButterCMSSDK is designed to be easy to integrate into your existing Swift project. The package supports iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 4.0 or their higher versions.

## Quick start
First create new project in XCode.

Next, add the package dependency.

### Creating ButterCMSClient

ButterCMSClient can use either shared URLSession 
```
var butter = ButterCMSClient(apiKey: "YOUR_API_KEY")
```

Or your own URLSession
```
var butter = ButterCMSClient(apiKey: "YOUR_API_KEY", urlSession: yourURLSession)
```

###Getting data from ButterCMS
```
butter.getPosts(parameters: [
        .preview,
        .excludeBody,
        .page(value: 1),
        .pageSize(value: 10)
            ]) { result in
        switch result {
        case .success(let posts):
            print("Count: \(posts.meta.count)")
            posts.data.compactMap() { print("Post: \($0.title)") }
        case .failure(let error):
            print("getPost failed with Error: \(error)")
        }
}
```
###Collection data model
Collection requires custom sub-class of the class CollectionItem to be defined. 

```
private class FaqItem: CollectionItem {
    var meta: CollectionItemMeta
    var question: String = ""
    var answer: String = ""
}

butter.getCollection(slug: "faq", type: FaqItem.self) { result in
    // do something with the result
}
```

###Page data mode
Page requires custom sub-class of PageField class to be defined.
```
private struct PageFields: Codable {
    var name: String
}

butter.getPage(slug: "slug", pageTypeSlug: "type", type: PageFields.self) { result in
    // do something with the result
}
```
