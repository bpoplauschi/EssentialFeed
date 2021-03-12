//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 03/03/2021.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
