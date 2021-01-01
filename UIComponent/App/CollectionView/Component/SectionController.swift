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
    
    public var itemSpacing: CGFloat { 0 }
    public var lineSpacing: CGFloat { 0 }
    public var insets: UIEdgeInsets { .init(top: 0, left: 0, bottom: 0, right: 0) }
    
    public init(appCollectionView: AppCollectionView) {
        self.appCollectionView = appCollectionView
    }
    
    open func size(at row: Int, in width: CGFloat) -> CGSize { fatalError("size() must be overridden") }
    open func numberOfIems(at section: Int, in _: UICollectionView) -> Int { fatalError("numberOfItems() must be overridden") }
    open func cell(at indexPath: IndexPath, in _: UICollectionView) -> UICollectionViewCell { fatalError("cell() must be overridden") }
}
