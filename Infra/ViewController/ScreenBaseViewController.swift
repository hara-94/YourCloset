//
//  ScreenBaseViewController.swift
//  Infra
//
//  Created by hikaruhara on 2021/01/01.
//

import UIKit

public protocol DependencyProtocol {
    associatedtype ViewModel: ViewModelProtocol
}

open class ScreenBaseViewController<Dependency: DependencyProtocol>: UIViewController {
    //TODO: ここpublicでいいのか問題
    public var viewModel: Dependency.ViewModel?
    
    open override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
    }
    
    open func update(viewModel: Dependency.ViewModel?) {
        self.viewModel = viewModel
    }
}
