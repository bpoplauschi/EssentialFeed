# Essential Feed

![CI](https://github.com/bpoplauschi/EssentialFeed/workflows/CI/badge.svg)

Demo project created per taking the Essential Developer Academy course.

# Use Cases

## Load Feed From Remote Use Case

### Data (Input):

- URL

### Primary course (happy path):

1. Execute "Load Image Feed" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates image feed from valid data.
5. System delivers image feed.

### Invalid data – error course (sad path):

1. System delivers invalid data error.

### No connectivity – error course (sad path):

1. System delivers connectivity error.

------

## Load Feed From Cache Use Case

### Primary course (happy path):

1. Execute "Load Image Feed" command with above data.
2. System retrieves feed data from cache.
4. System creates image feed from cached data.
5. System delivers image feed.

### Retrieval error course (sad path):

1. System delivers error.

### Expired cache course (sad path):

1. System delivers no feed images.

### Empty cache course (sad path):

1. System delivers no feed images.

------

## Validate Feed Cache Use Case

### Data (Input):

- Max age (7 days)

### Primary course (happy path):

1. Execute "Validate Cache" command with above data.
2. System retrieves feed data from cache.
3. System validates cache is less than seven days old.

### Retrieval error course (sad path):

1. System deletes cache.

### Expired cache course (sad path):

1. System deletes the cache

------

## Cache Feed Use Case

### Data (Input):

- Image Feed

### Primary course (happy path):

1. Execute "Save Image Feed" command with above data.
2. System deletes old cache data.
3. System encodes image feed.
4. System timestamps the new cache.
5. System saves new cache data.
6. System delivers a success message.

### Deleting error course (sad path):

1. System delivers error.

### Saving error course (sad path):

1. System delivers error.

# Flowchart

```mermaid
graph TD
  show(Show image feed screen)
  fetch(Fetch image feed from remote)
  success{Success?}
  cache(Cache image feed)
  display(Display image feed)
  load(Load image feed from cache)
  success2{Success?}
  displayError(Display error)
  show-->fetch
  fetch-->success
  success-->|Yes|cache
  success-->|No|load
  cache-->display
  load-->success2
  success2-->|Yes|display
  success2-->|No|displayError
```

# Architecture

```mermaid
classDiagram

class FeedLoader { <<interface>> }
class FeedStore { <<interface>> }

FeedImage <-- FeedLoader
RemoteFeedLoader ..|> FeedLoader
RemoteFeedLoader --> FeedImage
FeedItemsMapper <-- RemoteFeedLoader
RemoteFeedItem <-- FeedItemsMapper
RemoteFeedItem <-- RemoteFeedLoader
RemoteFeedLoader --> HTTPClient
URLSessionHTTPClient ..|> HTTPClient
AnyHTTPClientImplementation ..|> HTTPClient
URLSessionHTTPClient --> Feed_Backend
RemoteWithLocalFallbackFeedLoader ..|> FeedLoader
RemoteWithLocalFallbackFeedLoader --> RemoteFeedLoader
RemoteWithLocalFallbackFeedLoader --> LocalFeedLoader
LocalFeedLoader ..|> FeedLoader
LocalFeedLoader --> FeedImage
LocalFeedLoader --> LocalFeedImage
LocalFeedLoader --> FeedStore
FeedStore --> LocalFeedImage
AnyFeedStoreImplementation --> FeedStore
FeedLoader <-- FeedViewController
FeedViewController --|> UIViewController
Feed_Assembler_Build_Factory --> RemoteWithLocalFallbackFeedLoader
Feed_Assembler_Build_Factory --> RemoteFeedLoader
Feed_Assembler_Build_Factory --> LocalFeedLoader
Feed_Assembler_Build_Factory --> FeedViewController
```
