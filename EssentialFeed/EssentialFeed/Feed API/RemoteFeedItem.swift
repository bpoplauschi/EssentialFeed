//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 23/01/2021.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
