//
//  ClosetPresenter.swift
//  YourCloset
//
//  Created by 原ひかる on 2020/12/27.
//

import UIKit

protocol ClosetPresenterProtocol: AnyObject {
    func process(event: ClosetPresenterOperation.Event)
}

final class ClosetPresenter: ClosetPresenterProtocol {
    weak var view: ClosetViewProtocol!
    var router: ClosetRouterProtocol!
    
    init(view: ClosetViewProtocol, router: ClosetRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func process(event: ClosetPresenterOperation.Event) {
        switch event {
        case .didLoad:
            print("didLoad")
        case let .transition(id):
            router.transitionToDetail(with: id)
        case let .remove(id):
            view.remove(with: id)
        }
    }
}

final class ClosetPresenterOperation {
    enum Event {
        case didLoad
        case transition(String)
        case remove(String)
    }
}
