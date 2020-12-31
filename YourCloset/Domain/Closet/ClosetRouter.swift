//
//  ClosetRouter.swift
//  YourCloset
//
//  Created by 原ひかる on 2020/12/27.
//

import Infra
import UIKit

protocol ClosetRouterProtocol: AnyObject {
    func transitionToDetail(with id: String)
}

final class ClosetRouter: ClosetRouterProtocol {
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func transitionToDetail(with id: String) {
        //view.navigationController?.pushViewController(viewController, animated: true)
        print("transitionToDetail id: \(id)")
    }
    
    static func assemble() -> UIViewController {
        let viewController: ClosetViewController = .init()
        let router: ClosetRouter = .init(view: viewController)
        viewController.presenter = ClosetPresenter(view: viewController, router: router, interactor: UseCase(.init(ClosetInteractor())))
        return viewController
    }
}
