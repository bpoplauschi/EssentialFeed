//
//  UIControl+TestHelpers.swift .swift
//  EssentialFeediOSTests
//
//  Created by Bogdan Poplauschi on 17/02/2021.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
