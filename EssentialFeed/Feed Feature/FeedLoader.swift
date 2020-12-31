//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bogdan P on 25/12/2020.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    typealias LoadFeedCompletion = (LoadFeedResult<Error>) -> Void
    
    func load(completion: @escaping LoadFeedCompletion)
}
