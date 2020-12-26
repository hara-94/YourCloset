//
//  UIView+.swift
//  Util
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit

public extension UIView {
    var layout: Layout {
        .init(of: self)
    }
    
    @discardableResult
    func addSubviews(_ subviews: [UIView]) -> Self {
        subviews.forEach { addSubview($0) }
        return self
    }
    
    func activateAutolayout() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
