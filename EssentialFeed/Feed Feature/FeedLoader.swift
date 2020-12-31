//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bogdan P on 25/12/2020.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    typealias LoadFeedCompletion = (LoadFeedResult) -> Void
    
    func load(completion: @escaping LoadFeedCompletion)
}
