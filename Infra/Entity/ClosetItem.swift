//
//  ClosetItem.swift
//  Infra
//
//  Created by hikaruhara on 2020/12/31.
//

import UIKit

public final class ClosetItem {
    private let imageUrl: String?
    private let name: String
    private let category: String
    private let colors: [UIColor]
    
    public init(imageUrl: String?, name: String, category: String, colors: [UIColor]) {
        self.imageUrl = imageUrl
        self.name = name
        self.category = category
        self.colors = colors
    }
}
