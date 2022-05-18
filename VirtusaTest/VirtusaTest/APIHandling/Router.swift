//
//  Router.swift
//  VirtusaTest
//
//  Created by Virat on 5/16/22.
//

import Foundation


protocol Router {
    var route : String { get }
    var baseURL : String { get }
    func handle<T:Codable>(responseObj : Data, returnModelType: T.Type) -> T?
    func isLoaderNeeded() -> Bool
    
}

