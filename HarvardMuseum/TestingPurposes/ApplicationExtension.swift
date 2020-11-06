//
//  ApplicationExtension.swift
//  HarvardMuseum
//
//  Created by Shootr on 02/11/2020.
//

import Foundation
import UIKit

extension UIViewController {
    func topViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topViewController()
            }
            return tab.topViewController()
        }
        return self.presentedViewController!.topViewController()
    }
}

extension UIApplication {
    func topViewController() -> UIViewController? {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.topViewController()
    }
}
