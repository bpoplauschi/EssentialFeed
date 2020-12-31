//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bogdan P on 25/12/2020.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedItem], Error>

public protocol FeedLoader {
    typealias LoadFeedCompletion = (LoadFeedResult) -> Void
    
    func load(completion: @escaping LoadFeedCompletion)
}
