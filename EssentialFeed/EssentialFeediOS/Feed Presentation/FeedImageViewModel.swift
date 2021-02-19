//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Bogdan Poplauschi on 18/02/2021.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
