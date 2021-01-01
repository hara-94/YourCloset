//
//  CGSize+.swift
//  Util
//
//  Created by hikaruhara on 2021/01/01.
//

import UIKit

public extension CGSize {
    func scaleToFit(_ width: CGFloat) -> Self {
        let magnification = width / self.width
        return .init(width: width, height: self.height * magnification)
    }
}
