# ButterCMSSDK
SDK for ButterCMS API.

## Documentation

For a comprehensive list of examples, check out the [API documentation](https://buttercms.com/docs/api/).

## Installation

### Swift Package Manager: 
1) open XCode->File->Swift Packages->Add Package Dependency
2) provide this git URL: https://git.applifting.cz/martin.srb/buttercms-swift.git and respective version e.g. 1.0.3
    
### CocoaPods
1) Install CocoaPods if not installed already
```
$ brew install cocoapods
``` 

2) Create a Podfile in the root directory of your project
```
$ pod init
```
3) Open generated Podfile, for example
```
$ open -a Xcode Podfile
```
4) Update podfile
```
target 'YourAppName' do
  use_frameworks!
pod 'ButterCMSSDK', '1.0.3'
end
```
5) Install ButterCMS pod
```
$ pod install
```

## Usage
To get started with the Butter API, instantiate the ButterCMSClient with the API key found in the [Butter Admin Settings](https://buttercms.com/settings/). 
 
```
import ButterCMSSDK
var butter = ButterCMSClient(apiKey: "YOUR_API_KEY")
```

Given the client is based on URLSession - meaning, in case you need more custom setting for URLSession you can pass one into constructor:

```
import ButterCMSSDK
var butter = ButterCMSClient(apiKey: "YOUR_API_KEY", urlSession: yourURLSession)
```

## APIs

All APIs are asynchronous and expects a completion() as a parameter. The completion() is called when the asynchronous call is finished. The completion() takes respective Response or Error encapsulated in the Result object as a parameter.

API may take additional array of parameters which specify either what data shall be returned or how they shall be returned. Check [Butter API doc](https://buttercms.com/docs/api/) for additional details. Every API parameters has its respective Enum listing allowed parameters and their value types. For example: 

```
public enum PostsParameters: Parameters {
    case preview
    case page(value: Int)
    case pageSize(value: Int)
    case excludeBody
    case authorSlug(value: String)
    case categorySlug(value: String)
    case tagSlug(value: String)
}
```
XCode can then suggest appropriate parameters as you type your code.

Typical way how to call an API is as follows:
```
import ButterCMSSDK
var butter = ButterCMSClient(apiKey: "YOUR_API_KEY")
butter.getPosts(parameters: [
        .preview,
        .excludeBody,
        .page(value: 1),
        .pageSize(value: 10)
            ]) { result in
        switch result {
        case .success(let posts):
            //Do something on success
            print("Count: \(posts.meta.count)")
            posts.data.compactMap() { print("Post: \($0.title)") }
        case .failure(let error):
            //Do something on failure
            print("getPost failed with Error: \(error)")
        }
}
```

### Blog Post APIs
#### Posts
```
getPost(slug: String, completion: @escaping (Result<PostResponse, Error>) -> Void)
```
```
getPosts(parameters: [PostsParameters] = [], completion: @escaping (Result<PostsResponse, Error>) -> Void)
```
```
searchPosts(parameters: [PostSearchParameters] = [], completion: @escaping (Result<PostsResponse, Error>) -> Void)
```
#### Authors
```
getAuthor(slug: String, parameters: [AuthorParameters] = [], completion: @escaping (Result<AuthorResponse, Error>) -> Void)
```
```
getAuthors(parameters: [AuthorParameters] = [], completion: @escaping (Result<AuthorsResponse, Error>) -> Void)
```

#### Categories
```
getCategory(slug: String, parameters: [CategoryParameters] = [], completion: @escaping (Result<CategoryResponse, Error>)
```
```
getCategories(parameters: [CategoryParameters] = [], completion: @escaping (Result<CategoriesResponse, Error>) -> Void)
```

#### Tags
```
getTag(slug: String, parameters: [TagParameters] = [], completion: @escaping (Result<TagResponse, Error>) -> Void)
```
```
getTags(parameters: [TagParameters] = [], completion: @escaping (Result<TagsResponse, Error>) -> Void)
```

### Pages API
The Pages in Butter CMS has configurable schema. See [ButterCMS doc](https://buttercms.com/kb/creating-editing-and-deleting-pages-and-page-types#creatingapage) for details how to create page. The schema defines fileds which can exist on the page. Individual fields can be of basic types like Strings as well as custom Structs or Classes. The SDK requires you to model the Page shema as a Codable Struct and pass it to getPages API. This allows the SDK to deserialize the page data for you. 

ButerCMS also provides a concept of Page types and you can get all pages of the same type by getPages() API. To read more about the Page types refer to [ButterCMS doc](https://buttercms.com/kb/creating-editing-and-deleting-pages-and-page-types#creatingapagetype). 
```
getPage<T: Decodable>(slug: String, parameters: [PageParameters] = [], pageTypeSlug: String, type: T.Type, completion: @escaping (Result<PageResponse<T>, Error>) -> Void)
```
```
getPages<T: Decodable>(parameters: [PagesParameters] = [], pageTypeSlug: String, type: T.Type, completion: @escaping (Result<PagesResponse<T>, Error>) -> Void)
```

### Collection API
Similar as Pages the Collections has also configurable schema. See [ButterCMS doc](https://buttercms.com/kb/creating-editing-and-deleting-collections#creatingacollection) for  more details. The schema again define fields which composes the collection item. The SDK requires you to model the collection item as a class an provide it as a parameter to the API.  The collection item class must implement the CollectionItem protocol.  

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


