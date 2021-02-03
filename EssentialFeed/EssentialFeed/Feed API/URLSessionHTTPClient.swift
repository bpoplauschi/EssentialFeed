//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Bogdan Poplauschi on 03/01/2021.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    private struct UnexpectedValuesRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
        session.dataTask(with: url) { data, response, error in
            completion(Result {
                switch (data, response, error) {
                case let (_, _, .some(error)):
                    throw error
                case let (.some(data), response as HTTPURLResponse, .none):
                    return (data, response)
                default:
                    throw UnexpectedValuesRepresentation()
                }
            })
        }.resume()
    }
}
