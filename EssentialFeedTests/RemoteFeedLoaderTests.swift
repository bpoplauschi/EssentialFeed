//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Bogdan P on 25/12/2020.
//

@testable import EssentialFeed
import XCTest

final class RemoteFeedLoader: FeedLoader {
    func load(completion: @escaping LoadFeedCompletion) {
    }
}

final class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
}
