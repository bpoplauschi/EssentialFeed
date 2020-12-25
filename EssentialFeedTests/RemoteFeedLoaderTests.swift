//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Bogdan P on 25/12/2020.
//

@testable import EssentialFeed
import XCTest

final class RemoteFeedLoader: FeedLoader {
    let url: URL
    let client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping LoadFeedCompletion) {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

final class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "http://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load(completion: { _ in })
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK:- Helpers
    
    private func makeSUT(url: URL = URL(string: "http://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        return (sut: RemoteFeedLoader(url: url, client: client), client: client)
    }
    
    private final class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
}
