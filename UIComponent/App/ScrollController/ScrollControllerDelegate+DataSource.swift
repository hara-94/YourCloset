//
//  ScrollControllerDelegate+DataSource.swift
//  UIComponent
//
//  Created by hikaruhara on 2021/01/03.
//

import UIKit

public protocol ScrollControllerDelegate: class { }

public protocol ScrollConstrollerDataSource: class {
    func before(_ viewController: UIViewController, in pageViewController: UIPageViewController) -> UIViewController?
    func after(_ viewController: UIViewController, in pageViewController: UIPageViewController) -> UIViewController?
}
