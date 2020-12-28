//
//  ClosetModule.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

public class ClosetModule: UICollectionViewCell, Module {
    public typealias ContentType = String
    
    public static func size(at row: Int, in collectionView: UICollectionView) -> CGSize {
        .init(width: collectionView.bounds.width, height: 100)
    }
    
    public func render(_ obj: String?) {
        contentView.backgroundColor = .red
    }
}
