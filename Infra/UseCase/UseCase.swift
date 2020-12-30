//
//  UseCase.swift
//  Infra
//
//  Created by hikaruhara on 2020/12/30.
//

import Foundation

public protocol UseCaseProtocol {
    associatedtype Parameter
    associatedtype Success
    associatedtype Failure: Error
    
    func execute(parameter: Parameter, reuslt: Result<Success, Failure>)
}

public class UseCase<Parameter, Success, Failure: Error> {
    private let instance: UseCaseInstanceBase<Parameter, Success, Failure>
    
    public init<T: UseCaseProtocol>(_ instance: UseCaseInstance<T>)
    where T.Parameter == Parameter, T.Success == Success, T.Failure == Failure
    {
        self.instance = instance
    }
    
    public func execute(parameter: Parameter, reuslt: Result<Success, Failure>) {
        instance.execute(parameter: parameter, reuslt: reuslt)
    }
}

public class UseCaseInstanceBase<Parameter, Success, Failure: Error> {
    public func execute(parameter: Parameter, reuslt: Result<Success, Failure>) {
        fatalError("execute must be overridden")
    }
}

public class UseCaseInstance<T: UseCaseProtocol>: UseCaseInstanceBase<T.Parameter, T.Success, T.Failure> {
    private let useCase: T
    
    public init(_ useCase: T) {
        self.useCase = useCase
    }
    
    public override func execute(parameter: T.Parameter, reuslt: Result<T.Success, T.Failure>) {
        useCase.execute(parameter: parameter, reuslt: reuslt)
    }
}
