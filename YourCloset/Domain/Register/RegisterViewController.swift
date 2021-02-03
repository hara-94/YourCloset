//
//  RegisterViewController.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import UIKit
import UIComponent
import Util

protocol RegisterViewProtocol: RegisterBaseViewController { }

final class RegisterViewController: RegisterBaseViewController, RegisterViewProtocol {
    var presenter: RegisterPresenterProtocol!
}

class RegisterBaseViewController: ScreenBaseViewController<RegisterDependency> {}
