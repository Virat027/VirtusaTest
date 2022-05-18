//
//  Storyboards.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

enum Storyboards: String {
    case Main
    
    func instantiateVC<T>(_ identifier: T.Type) -> T?  {
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        let storyboardID = String(describing: identifier)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: storyboardID) as? T else { return nil}
        return vc
    }
}
