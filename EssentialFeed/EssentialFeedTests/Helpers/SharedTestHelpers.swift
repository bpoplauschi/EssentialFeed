//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Bogdan Poplauschi on 27/01/2021.
//

import Foundation

func anyURL() -> URL { URL(string: "http://any-url.com")! }
func anyNSError() -> NSError { NSError(domain: "any error", code: 0) }
