//
//  Layout.swift
//  Util
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit

public final class Layout {
    public typealias Attribute = NSLayoutConstraint.Attribute
    
    private weak var view: UIView?
    private var nextView: UIView?
    private var constraints: [NSLayoutConstraint] = []
    
    init(of view: UIView) {
        self.view = view
    }
    
    public static func activateLayouts(_ layouts: [Layout]) {
        layouts.forEach { $0.activate() }
    }
    
    public func activate() {
        constraints.forEach { $0.isActive = true }
    }
    
    public func centerX(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .centerX, relatedBy: .equal, toItem: other  ?? view.superview, attribute: .centerX, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        return self
    }
    
    public func centerY(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .centerY, relatedBy: .equal, toItem: other ?? view.superview, attribute: .centerY, multiplier: 1, constant: 0)
        constraints.append(constraint)
        return self
    }
    
    public func width(_ value: CGFloat) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: value)
        constraints.append(constraint)
        return self
    }
    
    public func width(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .width, relatedBy: .equal, toItem: other ?? view.superview, attribute: .width, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        return self
    }
    
    public func height(_ value: CGFloat) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: value)
        constraints.append(constraint)
        return self
    }
    
    public func height(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .height, relatedBy: .equal, toItem: other ?? view.superview, attribute: .height, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        return self
    }
    
    public func top(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .top, relatedBy: .equal, toItem: other ?? view.superview, attribute: .top, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        return self
    }
    
    public func bottom(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .bottom, relatedBy: .equal, toItem: other ?? view.superview, attribute: .bottom, multiplier: multiplier, constant: -constant)
        constraints.append(constraint)
        return self
    }
    
    public func left(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .leading, relatedBy: .equal, toItem: other ?? view.superview, attribute: .leading, multiplier: multiplier, constant: constant)
        constraints.append(constraint)
        return self
    }
    
    public func right(to other: UIView? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        let constraint: NSLayoutConstraint = .init(item: view, attribute: .trailing, relatedBy: .equal, toItem: other ?? view.superview, attribute: .trailing, multiplier: multiplier, constant: -constant)
        constraints.append(constraint)
        return self
    }
    
    public func put(_ view: UIView) -> Self {
        nextView = view
        return self
    }
    
    public func toRight(_ value: CGFloat) -> Self {
        guard let view = view, let nextView = nextView else { return self }
        let constraint: NSLayoutConstraint = .init(item: nextView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: value)
        constraints.append(constraint)
        return self
    }
    
    public func under(_ value: CGFloat) -> Self {
        guard let view = view, let nextView = nextView else { return self }
        let constraint: NSLayoutConstraint = .init(item: nextView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: value)
        constraints.append(constraint)
        return self
    }
    
    public func over(_ value: CGFloat) -> Self {
        guard let view = view, let nextView = nextView else { return self }
        let constraint: NSLayoutConstraint = .init(item: nextView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: -value)
        constraints.append(constraint)
        return self
    }
}
