//
//  AppCollectionView.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit

public class AppCollectionView: UICollectionView {
    
    //TODO: 使うタイミングがない、かも、、
    weak var appCollectionViewDelegate: AppCollectionViewDelegate?
    weak var appCollectionViewDataSource: AppCollectionViewDataSource?
    
    var registeredCellIdentifiers: [String] = []
    private var sections: [SectionController]
    
    public init(sections: [SectionController]) {
        self.sections = sections
        let layout: UICollectionViewFlowLayout = .init()
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .white
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addSection(_ section: SectionController) {
        sections.append(section)
        reloadData()
    }
    
    public func sectionController(at index: Int) -> SectionController {
        return sections[index]
    }
}

extension AppCollectionView: UICollectionViewDelegate { }

extension AppCollectionView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let controller = sectionController(at: section)
        return controller.numberOfIems(at: section, in: collectionView)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let controller = sectionController(at: indexPath.section)
        return controller.cell(at: indexPath, in: collectionView)
    }
}

extension AppCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let controller = sectionController(at: indexPath.section)
        return controller.size(at: indexPath.row, in: collectionView.bounds.width - (controller.insets.left + controller.insets.right))
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let controller = sectionController(at: section)
        return controller.insets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let controller = sectionController(at: section)
        return controller.lineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let controller = sectionController(at: section)
        return controller.itemSpacing
    }
}
