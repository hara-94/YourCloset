//
//  ClosetViewController.swift
//  YourCloset
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit
import UIComponent

protocol ClosetViewProtocol: AnyObject {
    func remove(with id: String)
}

final class ClosetViewController: AppBaseViewController, ClosetViewProtocol{
    var presenter: ClosetPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        
        presenter.process(event: .didLoad)
    }
}

extension ClosetViewController {
    func remove(with id: String) {
        print("remove id: \(id)")
    }
}
