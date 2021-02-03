//
//  RegisterPresenter.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import UIKit

protocol RegisterPresenterProtocol: AnyObject {
    func process(_: RegisterPresenterOperation.Event)
}

final class RegisterPresenter: RegisterPresenterProtocol {
    weak var view: RegisterViewProtocol!
    var router: RegisterRouterProtocol!
    private let interactor: UseCase<Void, Void, Error>
    
    init(view: RegisterViewProtocol, router: RegisterRouterProtocol, interactor: UseCase<Void, Void, Error>) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func process(_: RegisterPresenterOperation.Event) {}
}

final class RegisterPresenterOperation {
    enum Event { }
}
