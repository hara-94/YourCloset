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
    
    public typealias Success = Void
    
    public typealias Failure = Error
    
    public func execute(parameter: Parameter, reuslt: ((Result<Success, Failure>) -> ())?) {
        print("\(String(describing: type(of: self))): execute")
    }
}
