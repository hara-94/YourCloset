//
//  UIStackView+.swift
//  Util
//
//  Created by hikaruhara on 2021/01/01.
//

import UIKit

public extension UIStackView {
    @discardableResult
    func addArrangedSubviews(_ views: [UIView]) -> Self {
        views.forEach { addArrangedSubview($0) }
        return self
    }
}
