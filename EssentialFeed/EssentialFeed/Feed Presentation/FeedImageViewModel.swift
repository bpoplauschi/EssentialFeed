//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 23/02/2021.
//

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}
