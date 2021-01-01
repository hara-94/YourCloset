//
//  AppBaseViewController.swift
//  UIComponent
//
//  Created by 原ひかる on 2020/12/27.
//

import Infra
import UIKit

open class AppBaseViewController: UIViewController {
    open override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    public var viewModel: ViewModelProtocol?
    
    open func update(viewModel: ViewModelProtocol?) {
        self.viewModel = viewModel
    }
}
