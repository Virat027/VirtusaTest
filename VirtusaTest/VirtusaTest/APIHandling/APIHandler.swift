//
//  APIHandler.swift
//  VirtusaTest
//
//  Created by Virat on 5/11/22.
//

import Foundation
import UIKit
typealias responseData = (Data?, Error?) -> Void

final class APIHandler {
    static var shared = APIHandler()
    private init() {}
    
    var loaderView: UIAlertController?
    
    func getResponseData(with api: Router, onCompletion: @escaping responseData) {
        let fullPath = api.baseURL + api.route
        
        if api.isLoaderNeeded() {
            showLoader()
        }
        
        let url = URL(string: fullPath)
        let dataTask = URLSession.shared.dataTask(with: url!) {[weak self] (data, response, error) in
            guard let self = self else { return }
            self.stopLoader()
            
            guard let dataResponse = data, let _ = response as? HTTPURLResponse, error == nil else {
                onCompletion(nil, error)
                return
            }
            onCompletion(dataResponse, nil)
        }
         dataTask.resume()
     }
    
    func showLoader() {
        loaderView = UIAlertController(title: nil, message: "Please Wait", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        loaderView?.view.addSubview(indicator)
        UIApplication.topViewController()?.present(loaderView!, animated: true, completion: nil)
        
    }
    
    func stopLoader() {
        if let view = loaderView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
                view.dismiss(animated: true, completion: nil)
                view.removeFromParent()
            }
            
        }
    }
}
