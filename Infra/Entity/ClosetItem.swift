//
//  ClosetItem.swift
//  Infra
//
//  Created by hikaruhara on 2020/12/31.
//

import UIKit

public final class ClosetItem {
    public let imageUrl: String?
    public let name: String
    public let category: String
    public let colors: [UIColor]
    
    public init(imageUrl: String?, name: String, category: String, colors: [UIColor]) {
        self.imageUrl = imageUrl
        self.name = name
        self.category = category
        self.colors = colors
    }
}
