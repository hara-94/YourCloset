//
//  ClosetViewController.swift
//  YourCloset
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit
import UIComponent
import Util

protocol ClosetViewProtocol: AnyObject {
    func remove(with id: String)
}

final class ClosetViewController: AppBaseViewController, ClosetViewProtocol{
    var presenter: ClosetPresenterProtocol!
    
    private let collectionView: AppCollectionView = .init(sections: [])
    
    override func loadView() {
        super.loadView()
        
        presenter.process(event: .didLoad)
        
        let section1: ClosetSectionController = .init(items: ["aaa", "bbb", "ccc", "ddd", "eee"], appCollectionView: collectionView)
        collectionView.addSection(section1)
        view.addSubviews([collectionView]).activateAutolayout()
        Layout.activateLayouts([
            collectionView.layout.top().bottom().left().right()
        ])
    }
}

extension ClosetViewController {
    func remove(with id: String) {
        print("remove id: \(id)")
    }
}
