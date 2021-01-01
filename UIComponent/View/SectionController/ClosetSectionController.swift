//
//  ClosetSectionController.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

public final class ClosetSectionController: ModuleSectionController<ClosetModule> {
    public override var itemSpacing: CGFloat { 8 }
    public override var lineSpacing: CGFloat { 8 }
    public override var insets: UIEdgeInsets { .init(top: 0, left: 16, bottom: 0, right: 16) }
}
