//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Bogdan Poplauschi on 28/02/2021.
//

import EssentialFeed
import Foundation

func anyNSError() -> NSError { NSError(domain: "any error", code: 0) }
func anyURL() -> URL { URL(string: "http://any-url.com")! }
func anyData() -> Data { Data("any data".utf8) }

func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())]
}
