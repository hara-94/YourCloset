//
//  RegisterInteractor.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/03.
//

import Infra
import UIKit

final class RegisterInteractor: UseCaseProtocol {
    typealias Parameter = Void
    typealias Success = Void
    typealias Failure = Error
    
    func execute(parameter: Parameter, result: ((Result<Success, Failure>) -> ())?) {}
}
