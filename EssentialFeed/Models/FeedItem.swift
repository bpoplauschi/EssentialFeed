//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Bogdan P on 25/12/2020.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
