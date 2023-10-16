//
//  UIStoryboardExtension.swift
//  USERSFORUM
//
//  Created by Vivek on 16/10/23.
//

import Foundation
import UIKit

private class BundleLocator {}

extension UIStoryboard {
    static func instantiate<T: UIViewController>(identifier: StoryboardIdentifier) -> T! {
        let bundle = Bundle(for: BundleLocator.self)
        let storyboard = UIStoryboard(name: identifier.storyboardName, bundle: bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier.rawValue)
        guard let viewController = viewController as? T else {
            fatalError("ViewController: \(identifier.rawValue) is not of type: \(T.self)")
        }
        return viewController
    }
}
