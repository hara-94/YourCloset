//
//  ClosetModule.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

public class ClosetModule: ModuleCell<String> {
    public override func render(_ obj: ModuleCell<String>.ContentType?) {
        contentView.backgroundColor = .red
    }
}
