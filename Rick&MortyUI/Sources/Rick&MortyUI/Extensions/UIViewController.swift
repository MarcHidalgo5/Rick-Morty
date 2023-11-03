//
//  Created by Marc Hidalgo on 2/11/23.
//

import UIKit

/// This extension provides a method swizzling implementation for UIViewController.
/// It swizzles the `viewDidLoad` method to customize the back button display mode.

public extension UIViewController {
    
    static func swizzleBackButton() {
        _swizzle(UIViewController.self, from: #selector(viewDidLoad), to: #selector(swizzled_viewDidLoad))
    }
    
    @objc func swizzled_viewDidLoad() {
        self.swizzled_viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
    }
}

private func _swizzle(_ class_: AnyClass, from selector1: Selector, to selector2: Selector) {
    guard let method1: Method = class_getInstanceMethod(class_, selector1),
          let method2: Method = class_getInstanceMethod(class_, selector2) else
    {
        return
    }
    
    if class_addMethod(class_, selector1, method_getImplementation(method2), method_getTypeEncoding(method2)) {
        class_replaceMethod(class_, selector2, method_getImplementation(method1), method_getTypeEncoding(method1))
    }
    else {
        method_exchangeImplementations(method1, method2)
    }
}
