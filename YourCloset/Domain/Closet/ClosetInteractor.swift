//
//  ClosetInteractor.swift
//  YourCloset
//
//  Created by hikaruhara on 2020/12/31.
//

import Infra
import UIKit

final class ClosetInteractor: UseCaseProtocol {
    public typealias Parameter = Void
    public typealias Success = Int
    public typealias Failure = ClosetInteractor.DemoError
    
    public func execute(parameter: Parameter, result: ((Result<Success, Failure>) -> ())?) {
        let int = Int.random(in: 0...10)
        if int == 0 {
            result?(.failure(.zero(int)))
        } else {
            result?(.success(int * 2))
        }
    }
}

extension ClosetInteractor {
    enum DemoError: Error {
        case zero(Int)
    }
}
