//
//  ClosetUseCase.swift
//  Infra
//
//  Created by hikaruhara on 2020/12/31.
//

import Foundation

public final class ClosetUseCase: UseCaseProtocol {
    public typealias Parameter = Void
    
    public typealias Success = Void
    
    public typealias Failure = Error
    
    public func execute(parameter: Parameter, reuslt: Result<Success, Failure>) {
        print("ClosetUseCase: execute")
    }
}
