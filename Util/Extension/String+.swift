//
//  String+.swift
//  Util
//
//  Created by hikaruhara on 2021/01/02.
//

import UIKit

public extension String {
    func width(in font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: attributes)
        return size.width
    }
}
