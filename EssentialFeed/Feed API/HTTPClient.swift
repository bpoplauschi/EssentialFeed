//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Bogdan P on 27/12/2020.
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
