//
//  RoomViewModel.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import Foundation

struct RoomViewModel {
    
    func getPeople(with api: Router, _ completion: @escaping (PeopleDataModel?, Error?) -> Void) {
        APIHandler.shared.getResponseData(with: api) { data, error in
            
            if error == nil {
                if let res = data {
                    if let obj = api.handle(responseObj: res, returnModelType: PeopleDataModel.self) {
                        completion(obj, nil)
                        
                    }else {
                        completion(nil, nil)
                    }
                }
            } else {
                completion(nil, error)
                
            }
        }
    }
    
    func getRooms(with api: Router, _ completion: @escaping ([RoomsDataModel]?, Error?) -> Void) {
        APIHandler.shared.getResponseData(with: api) { data, error in
            
            if error == nil {
                if let res = data {
                    if let obj = api.handle(responseObj: res, returnModelType: [RoomsDataModel].self) {
                        completion(obj, nil)
                        
                    }else {
                        completion(nil, nil)
                    }
                }
            } else {
                completion(nil, error)
                
            }
        }
    }
}
