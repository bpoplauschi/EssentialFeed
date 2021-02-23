//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Bogdan Poplauschi on 23/02/2021.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
