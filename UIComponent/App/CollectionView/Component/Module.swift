//
//  Module.swift
//  UIComponent
//
//  Created by hikaruhara on 2020/12/28.
//

import UIKit

public protocol Module: UICollectionViewCell {
    associatedtype ContentType
    
    static func size(at row: Int, in width: CGFloat) -> CGSize
    func render(_ obj: ContentType?)
}
