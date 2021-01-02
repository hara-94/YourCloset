//
//  TabViewController.swift
//  YourCloset
//
//  Created by hikaruhara on 2021/01/01.
//

import UIKit

final class TabViewController: UITabBarController {
    override func loadView() {
        super.loadView()
        let closetViewController = ClosetRouter.assemble()
        
        self.viewControllers = [closetViewController]
        setViewControllers(viewControllers, animated: false)
    }
}
