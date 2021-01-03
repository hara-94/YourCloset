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
    
    private let pageViewController: UIPageViewController = .init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    private var viewControllers: [ScrollableController] = []
    private var items: [String?] = []
    
    weak var scrollControllerDelegate: ScrollControllerDelegate?
    weak var scrollControllerDataSource: ScrollConstrollerDataSource?
    
    public convenience init(viewControllers: [ScrollableController]) {
        self.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        items = viewControllers.map { $0.scrollName }
        pageViewController.setViewControllers([self.viewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        setup()
    }
    
    private func setup() {
        edgesForExtendedLayout = []
        pageViewController.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Item.self, forCellWithReuseIdentifier: "cell")
        view.addSubviews([collectionView, pageViewController.view]).activateAutolayout()
        Layout.activateLayouts([
            collectionView.layout.top().left().right().height(Item.itemHeight).put(pageViewController.view).under(0),
            pageViewController.view.layout.bottom().left().right()
        ])
    }
}

extension ScrollController: UIPageViewControllerDelegate { }

extension ScrollController: UIPageViewControllerDataSource {
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return scrollControllerDataSource?.before(viewController, in: pageViewController)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return scrollControllerDataSource?.after(viewController, in: pageViewController)
    }
}

extension ScrollController: UICollectionViewDelegate { }

extension ScrollController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        return .init(width: items[indexPath.item]?.width(in: .systemFont(ofSize: 14)) ?? 0 + 10, height: Item.itemHeight)
    }
}
