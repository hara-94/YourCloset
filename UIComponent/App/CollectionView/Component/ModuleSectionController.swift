//
//  ModuleSectionController.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/28.
//

import UIKit

public class ModuleSectionController<M>: SectionController where M: UICollectionViewCell, M: Module {
    
    public override func cell(at indexPath: IndexPath, in _: UICollectionView) -> UICollectionViewCell {
        let cell = dequeueReusableCell(M.self, at: indexPath)
        return cell
    }
}

extension ModuleSectionController {
    func dequeueReusableCell(_ moduleCell: M.Type, at indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: type(of: moduleCell.self))
        if !appCollectionView.registeredCellIdentifiers.contains(identifier) {
            appCollectionView.registeredCellIdentifiers.append(identifier)
        }
        appCollectionView.register(moduleCell, forCellWithReuseIdentifier: identifier)
        let cell = appCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}
