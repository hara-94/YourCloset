//
//  ClosetViewController.swift
//  YourCloset
//
//  Created by 原ひかる on 2020/12/27.
//

import Infra
import UIKit
import UIComponent
import Util

protocol ClosetViewProtocol: ClosetBaseViewController {
    func remove(with id: String)
}

final class ClosetViewController: ClosetBaseViewController, ClosetViewProtocol {
    var presenter: ClosetPresenterProtocol!
    
    private let collectionView: AppCollectionView = .init(sections: [])
    private let tabbar: AppTabBar = .init()
    
    override func loadView() {
        super.loadView()
        
        presenter.process(event: .didLoad)
        view.addSubviews([collectionView, tabbar]).activateAutolayout()
        Layout.activateLayouts([
            collectionView.layout.top().bottom().left().right(),
            
        ])
        print("safearea: \(view.safeAreaInsets)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        Layout.activateLayouts([
            tabbar.layout.left(constant: 5).right(constant: 5).bottom(constant: view.safeAreaInsets.bottom)
        ])
    }
    
    override func update(viewModel: ClosetViewModel?) {
        super.update(viewModel: viewModel)
        guard let viewModel = viewModel else { return }
        let items = viewModel.items
        let section: ClosetSectionController = .init(items: items, appCollectionView: collectionView)
        collectionView.addSection(section)
        collectionView.reloadData()
    }
}

extension ClosetViewController {
    func remove(with id: String) {
        
    }
}

class ClosetBaseViewController: ScreenBaseViewController<ClosetDependency> {}
