//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Bogdan P on 25/12/2020.
//

@testable import EssentialFeed
import XCTest

final class RemoteFeedLoader: FeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load(completion: @escaping LoadFeedCompletion) {
        client.get(from: URL(string: "http://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load(completion: { _ in })
        
        XCTAssertNotNil(client.requestedURL)
    }
}
