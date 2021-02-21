//
//  UITableView+Dequeing.swift
//  EssentialFeediOS
//
//  Created by Bogdan Poplauschi on 21/02/2021.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
