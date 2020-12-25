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
        HTTPClient.shared.get(from: URL(string: "http://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load(completion: { _ in })
        
        XCTAssertNotNil(client.requestedURL)
    }
}
