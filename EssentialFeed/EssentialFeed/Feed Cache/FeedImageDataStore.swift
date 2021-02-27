//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 27/02/2021.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
