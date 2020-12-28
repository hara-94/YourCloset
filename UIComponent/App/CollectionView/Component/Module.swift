//
//  Module.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

public protocol Module {
    associatedtype ContentType
    
    func render(_ obj: ContentType?)
}

public class ModuleCell<ModuleContent>: UICollectionViewCell, Module {
    public typealias ContentType = ModuleContent
    
    public func render(_ obj: ContentType?) {
        print("render is not overridden")
    }
}
