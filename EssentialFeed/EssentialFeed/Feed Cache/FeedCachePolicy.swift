//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 27/01/2021.
//

import Foundation

final class FeedCachePolicy {
    private init() {}
    
    private static let calendar = Calendar.init(identifier: .gregorian)
        
    private static var maxCacheAgeInDays: Int { 7 }
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else { return false }
        return date < maxCacheAge
    }
}
