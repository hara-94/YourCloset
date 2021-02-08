//
//  RootViewController.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/02/04.
//

import UIKit

class RootViewController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let controllers = viewControllers().map { controller -> UIViewController in
            let ctr = UINavigationController(rootViewController: controller)
            return ctr
        }
        setViewControllers(controllers, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RootViewController {
    func viewControllers() -> [UIViewController] {
        let viewControllers = [
            ClosetRouter.assemble(),
            RegisterRouter.assemble()
        ]
        return viewControllers
    }
}
