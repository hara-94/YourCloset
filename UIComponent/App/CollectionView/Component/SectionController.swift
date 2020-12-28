//
//  SectionView.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

open class SectionController {
    weak var appCollectionView: AppCollectionView!
    
    var section: Int = 0
    
    public var itemSpacing: CGFloat = 0
    public var insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    
    init(appCollectionView: AppCollectionView, layoutType: LayoutType = .default) {
        self.appCollectionView = appCollectionView
        layoutType.setup(itemSpacing: &itemSpacing, insets: &insets)
    }
    
    open func size(for section: Int, in _: UICollectionView) -> CGSize { fatalError("size() must be overridden") }
    open func numberOfIems(at section: Int, in _: UICollectionView) -> Int { fatalError("numberOfItems() must be overridden") }
    open func cell(at index: Int, in _: UICollectionView) -> UICollectionViewCell { fatalError("cell() must be overridden") }
}

public extension SectionController {
    enum LayoutType {
        case `default`
        case fill
        
        func setup(itemSpacing: inout CGFloat, insets: inout UIEdgeInsets) {
            switch self {
            case .default:
                itemSpacing = 8
                insets = .init(top: 16, left: 16, bottom: 16, right: 16)
            case .fill:
                itemSpacing = 8
                insets = .init(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }
}
