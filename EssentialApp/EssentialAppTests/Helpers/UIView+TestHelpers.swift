//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Bogdan Poplauschi on 14/03/2021.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
