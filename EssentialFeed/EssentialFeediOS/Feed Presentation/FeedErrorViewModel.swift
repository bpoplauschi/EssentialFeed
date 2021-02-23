//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Bogdan Poplauschi on 23/02/2021.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
