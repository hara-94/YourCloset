//
//  AppTabBar.swift
//  UIComponent
//
//  Created by hikaruhara on 2021/01/02.
//

import UIKit

public class AppTabBar: UITabBar {
    private let item1: UITabBarItem = .init(title: "item1", image: .checkmark, selectedImage: .checkmark)
    private let item2: UITabBarItem = .init(title: "item2", image: .actions, selectedImage: .actions)
    private let item3: UITabBarItem = .init(title: "item3", image: .remove, selectedImage: .remove)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        items = [item1, item2, item3]
        delegate = self
        layer.borderWidth = 1
        layer.borderColor = .init(red: 1/255, green: 76/255, blue: 134/255, alpha: 1)
        layer.cornerRadius = 16
        backgroundColor = .white
        UITabBar.appearance().backgroundImage = UIImage()
    }
}

extension AppTabBar: UITabBarDelegate {
    
}
