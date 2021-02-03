//
//  RegisterContract.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import Foundation

struct RegisterDependency: DependencyProtocol {
    typealias ViewModel = RegisterViewModel
}

class RegisterViewModel: ViewModelProtocol { }
