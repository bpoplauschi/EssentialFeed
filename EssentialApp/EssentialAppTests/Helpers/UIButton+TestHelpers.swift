//
//  UIButton+TestHelpers.swift .swift
//  EssentialFeediOSTests
//
//  Created by Bogdan Poplauschi on 17/02/2021.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
