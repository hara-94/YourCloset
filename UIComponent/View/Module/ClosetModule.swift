//
//  ClosetModule.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import Infra
import UIKit
import Util

public class ClosetModule: UICollectionViewCell, Module {
    public typealias ContentType = ClosetItem
    
    private static let expectedContentSize: CGSize = .init(width: 167.5, height: 290)
    
    private let imageView: UIImageView = {
        let view: UIImageView = .init()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.backgroundColor = .init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label: UILabel = .init()
        label.font = .boldSystemFont(ofSize: 13)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label: UILabel = .init()
        label.font = .systemFont(ofSize: 11)
        label.textColor = .init(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let colorsStackView: UIStackView = {
        let view: UIStackView = .init()
        view.axis = .horizontal
        view.spacing = 2
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func size(at row: Int, in width: CGFloat) -> CGSize {
        let _width = (width - 8) / 2
        return Self.expectedContentSize.scaleToFit(_width)
    }
    
    public func render(_ obj: ContentType?) {
        nameLabel.text = "アイテム名"
        categoryLabel.text = "カテゴリー名"
        colors(from: [.red, .gray, .blue])
    }
    
    private func setup() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = .init(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        contentView.addSubviews([imageView, nameLabel, categoryLabel, colorsStackView]).activateAutolayout()
        Layout.activateLayouts([
            imageView.layout.top().left().right().height(multiplier: 237 / 290).put(nameLabel).under(8),
            nameLabel.layout.left(constant: 8).right(constant: 8).put(categoryLabel).under(6),
            categoryLabel.layout.left(constant: 8).right(constant: 8),
            colorsStackView.layout.right(constant: 6).bottom(constant: 6)
        ])
    }
    
    private func colors(from value: [UIColor]) {
        value.forEach { (color) in
            let view: UIView = .init()
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
            view.backgroundColor = color
            colorsStackView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layout.width(10).height(10).activate()
        }
    }
}
