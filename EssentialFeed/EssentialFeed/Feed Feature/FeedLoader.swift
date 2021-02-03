//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bogdan P on 25/12/2020.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
