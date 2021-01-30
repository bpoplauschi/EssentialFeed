//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Bogdan P on 27/12/2020.
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>

public protocol HTTPClient {
    /**
     The completion handler can be invoked in any thread.
     Clients are responsible to dispatch to appropriate threads, if needed.
     */
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
