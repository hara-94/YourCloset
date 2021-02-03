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
    
    override func loadView() {
        super.loadView()
        
        presenter.process(event: .didLoad)
        view.addSubviews([collectionView]).activateAutolayout()
        Layout.activateLayouts([
            collectionView.layout.top().bottom().left().right(),
        ])
        //TODO: 下にscrollつける用
        navigationController?.navigationBar.shadowImage = UIImage()
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
    func remove(with id: String) {}
}

class ClosetBaseViewController: ScreenBaseViewController<ClosetDependency> {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "クローゼット"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
