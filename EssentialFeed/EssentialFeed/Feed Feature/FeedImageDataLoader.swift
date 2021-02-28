//
//  FeedImageDataLoader.swift .swift
//  EssentialFeediOS
//
//  Created by Bogdan Poplauschi on 17/02/2021.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
