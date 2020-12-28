//
//  File.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit

public protocol AppCollectionViewDataSource: class {
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func cellForItem(at indexPath: IndexPath, of view: UICollectionView) -> UICollectionViewCell
}
