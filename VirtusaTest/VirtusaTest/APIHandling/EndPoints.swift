//
//  EndPoints.swift
//  VirtusaTest
//
//  Created by Virat on 5/16/22.
//

import Foundation

enum EndPoints {
    case getPeople
    case getRooms
    
}

extension EndPoints: Router {
    
    func handle<T:Codable>(responseObj: Data, returnModelType: T.Type) -> T? {
        let response = try? JSONDecoder().decode(returnModelType.self, from: responseObj)
        return response
        
    }
    
    var route: String {
        switch self {
        case .getPeople:
            return APIPaths.people
            
        default:
            return APIPaths.rooms
        }
    }
    
    var baseURL: String {
        return APIPaths.baseURL
    }
    
    func isLoaderNeeded() -> Bool {
        return true
    }
   
    
}

