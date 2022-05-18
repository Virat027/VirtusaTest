//
//  Helpers.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

extension NSObject {
    class var identifier: String {
        return String(describing: self)
        
    }
}

extension String {
    func toDate() -> String? {
        let fromFormatter = DateFormatter()
          fromFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

          let toFormatter = DateFormatter()
          toFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

          guard let date = fromFormatter.date(from: self) else {
            return nil
            
          }

          return toFormatter.string(from: date)
    }
}

extension UIApplication {
    public class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
