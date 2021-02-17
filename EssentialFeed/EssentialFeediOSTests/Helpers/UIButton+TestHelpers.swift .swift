//
//  UIButton+TestHelpers.swift .swift
//  EssentialFeediOSTests
//
//  Created by Bogdan Poplauschi on 17/02/2021.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
