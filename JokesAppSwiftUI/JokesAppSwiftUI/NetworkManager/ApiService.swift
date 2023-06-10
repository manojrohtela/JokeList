//
//  ApiService.swift
//  JokesAppSwiftUI
//
//  Created by Manoj kumar on 09/06/23.
//

import Foundation

enum HttpMethod:String{
    case GET = "get"
    case POST = "post"
    case DELETE = "delete"
}


class APIService : ServiceProtocol {
    
    func fetchJoke(urlStr:String,completion: @escaping (String?) -> Void) {
        HttpHandler().getData(urlStr:urlStr,completion)
    }
}

class HttpHandler{
     func getData(urlStr:String,_ completion: @escaping (String?) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        let urlRequest = RequestManager().createRequest(url: url, httpMethod: .GET)
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in
            guard let data = responseData else {
                completion(nil)
                return
            }
            guard let joke = ResponseHandler().parseResponse(type: String.self, data: data) else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(joke)
            }
        }.resume()
    }
}

class ResponseHandler {
    func parseResponse<T>(type: T.Type,data:Data) -> T? where T : Decodable{
        guard let obj = try? JSONDecoder().decode(type, from: data) else{
            return nil
        }
        return obj
        // Parse the network response into array
    }
}


struct DataBaseHandler{
    func saveData(key:String,value:Any){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getData(key:String)->Any?{
        return UserDefaults.standard.value(forKey: key)
    }
}
