//
//  RequestManager.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

class RequestManager {
    typealias complition = (_ responce: Data?, _ error: Error?) -> Void
    
    /// get request
    /// - Parameters:
    ///   - url: url
    ///   - complition: complition
    func get(with url: URL, complition: @escaping complition) {
        let request = self.getRequest(url, "GET")
        NetworkManager.main.requestToServer(request: request) { (data, request, error) in
            if let data = data {
                let str = String(decoding: Data(data), as: UTF8.self)
                if let data = str.data(using: String.Encoding.utf8 ) {
                    complition(data, nil)
                }else{
                    let error = NSError(domain: url.path, code: 5001, userInfo: ["message":"Unknown Error occurred"]) as Error
                    complition(nil, error)
                }
            } else {
                complition(nil, error)
                
            }
        }
    }
    
    ///  will return requent object
    /// - Parameters:
    ///   - url: URL
    ///   - method: request type
    ///   - body: param
    private func getRequest(_ url: URL, _ method: String, _ body: Data? = nil) -> URLRequest {
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let _body = body {
            request.httpBody = _body
        }
        return request as URLRequest
    }
}
