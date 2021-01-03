//
//  ScrollController+Item.swift
//  UIComponent
//
//  Created by hikaruhara on 2021/01/03.
//

import UIKit

public extension ScrollController {
    final class Item: UICollectionViewCell {
        private let titleLabel: UILabel = {
            let label: UILabel = .init()
            label.font = .systemFont(ofSize: 14)
            label.textAlignment = .center
            return label
        }()
        static internal var itemHeight: CGFloat = 45
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public override func prepareForReuse() {
            super.prepareForReuse()
            titleLabel.text = nil
        }
        
        private func setup() {
            contentView.backgroundColor = .blue
            contentView.addSubviews([titleLabel]).activateAutolayout()
            titleLabel.layout.centerX().centerY().activate()
        }
        
        public func set(title: String?) {
            titleLabel.text = title
        }
    }
}
