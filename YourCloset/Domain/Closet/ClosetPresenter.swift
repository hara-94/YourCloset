//
//  ClosetPresenter.swift
//  YourCloset
//
//  Created by 原ひかる on 2020/12/27.
//

import Infra
import UIKit

protocol ClosetPresenterProtocol: AnyObject {
    func process(event: ClosetPresenterOperation.Event)
}

final class ClosetPresenter: ClosetPresenterProtocol {
    weak var view: ClosetViewProtocol!
    var router: ClosetRouterProtocol!
    private let interactor: UseCase<Void, Int, ClosetInteractor.DemoError>
    private var viewModel: ClosetViewModel?
    
    init(view: ClosetViewProtocol, router: ClosetRouterProtocol, interactor: UseCase<Void, Int, ClosetInteractor.DemoError>) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func process(event: ClosetPresenterOperation.Event) {
        viewModel = .init(items: [])
        switch event {
        case .didLoad:
            interactor.execute(parameter: ()) { [weak self] result in
                switch result {
                case let .success(count):
                    [Int](0...count - 1).forEach { [weak self] count in
                        self?.viewModel?.items.append(.init(imageUrl: nil, name: "item: \(count)", category: "category", colors: [.gray]))
                    }
                    self?.view.update(viewModel: self?.viewModel)
                case let .failure(error):
                    switch error {
                    case let .zero(count):
                        print("errorCount: \(count)")
                    }
                }
            }
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
