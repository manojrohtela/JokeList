//
//  Request.swift
//  JokesAppSwiftUI
//
//  Created by Manoj kumar on 09/06/23.
//

import Foundation
class RequestManager{
    static var shared = RequestManager()
    init(){}
    
    
    
    func createRequest(url:URL,requestBody:Data? = nil,httpMethod:HttpMethod)->URLRequest{
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
}
