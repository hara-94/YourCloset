//
//  ModuleSectionController.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

public class ModuleSectionController<ContentModule: Module>: SectionController {
    
    private var items: [ContentModule.ContentType] = []
    
    public init(items: [ContentModule.ContentType], appCollectionView: AppCollectionView, layoutType: SectionController.LayoutType = .default) {
        self.items = items
        super.init(appCollectionView: appCollectionView, layoutType: layoutType)
    }
    
    public override func cell(at indexPath: IndexPath, in _: UICollectionView) -> UICollectionViewCell {
        let cell = dequeueReusableCell(ContentModule.self, at: indexPath)
        cell.render(items[indexPath.row])
        return cell
    }
    
    public override func size(at row: Int, in collectionView: UICollectionView) -> CGSize {
        return ContentModule.size(at: row, in: collectionView)
    }
    
    public override func numberOfIems(at section: Int, in _: UICollectionView) -> Int {
        return items.count
    }
}

extension ModuleSectionController {
    func dequeueReusableCell<Cell: Module>(_ moduleCell: Cell.Type, at indexPath: IndexPath) -> Cell {
        let identifier = String(describing: type(of: moduleCell.self))
        if !appCollectionView.registeredCellIdentifiers.contains(identifier) {
            appCollectionView.registeredCellIdentifiers.append(identifier)
        }
        appCollectionView.register(moduleCell, forCellWithReuseIdentifier: identifier)
        guard let cell = appCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError()
        }
        return cell
    }
}
