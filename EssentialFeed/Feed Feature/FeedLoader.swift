//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bogdan P on 25/12/2020.
//

import Foundation

typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    typealias LoadFeedCompletion = (LoadFeedResult) -> Void
    
    func load(completion: @escaping LoadFeedCompletion)
}
