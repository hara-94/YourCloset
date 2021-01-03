//
//  ScrollController.swift
//  UIComponent
//
//  Created by hikaruhara on 2021/01/03.
//

import UIKit
import Util

public final class ScrollController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        let view: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        return view
    }()
    
    private let contentView: UIView = .init()
    
    private var items: [String] = ["item1", "item2", "item3", "item4", "item5", "item6", "item7"]
    
    public override func loadView() {
        super.loadView()
        setup()
    }
    
    private func setup() {
        edgesForExtendedLayout = []
        contentView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Item.self, forCellWithReuseIdentifier: "cell")
        view.addSubviews([collectionView, contentView]).activateAutolayout()
        Layout.activateLayouts([
            collectionView.layout.top().left().right().height(Item.itemHeight).put(contentView).under(0),
            contentView.layout.bottom().left().right()
        ])
    }
}

extension ScrollController: UICollectionViewDelegate { }

extension ScrollController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Item else {
            fatalError("cell is not defined properly")
        }
        cell.set(title: items[indexPath.item])
        return cell
    }
}

extension ScrollController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: fontを別に設定している
        return .init(width: items[indexPath.item].width(in: .systemFont(ofSize: 14)) + 10, height: Item.itemHeight)
    }
}
