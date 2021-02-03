//
//  RegisterRouter.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import UIKit

protocol RegisterRouterProtocol: AnyObject { }

final class RegisterRouter: RegisterRouterProtocol {
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    static func assemble() -> UIViewController {
        let view: RegisterViewController = .init()
        let router: RegisterRouter = .init(view: view)
        view.presenter = RegisterPresenter(view: view, router: router, interactor: .init(.init(RegisterInteractor())))
        return view
    }
}
