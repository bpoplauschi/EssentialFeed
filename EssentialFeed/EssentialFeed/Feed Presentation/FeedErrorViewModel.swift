//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 23/02/2021.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
