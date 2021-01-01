//
//  ClosetContract.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/01/01.
//

import Infra
import Foundation

struct ClosetDependency: DependencyProtocol {
    typealias ViewModel = ClosetViewModel
}

final class ClosetViewModel: ViewModelProtocol {
    var items: [ClosetItem]
    
    init(items: [ClosetItem]) {
        self.items = items
    }
}

