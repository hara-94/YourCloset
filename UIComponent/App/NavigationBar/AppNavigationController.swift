//
//  AppNavigationController.swift
//  UIComponent
//
//  Created by hikaruhara on 2021/01/02.
//

import UIKit

public class AppNavigationController: UINavigationController {
    public convenience init(rootViewController: UIViewController, navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.viewControllers = [rootViewController]
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
