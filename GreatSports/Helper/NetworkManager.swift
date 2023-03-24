//
//  NetworkManager.swift
//  GreatSports
//
//  Created by MONIKA MOHAN on 21/03/2023.
//

import Foundation


enum HttpMethod:String{
    case get = "get"
    case post = "post"
}

enum Enpoint : String{
    case player = "players"
    case player_detail = "player/details"
}

let BaseURL : String = "https://ios.app99877.com/api/sc/"
//players
//"http://dummy.restapiexample.com/api/v1/"

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func dataTask(serviceURL:String,httpMethod:HttpMethod,parameters:[String:String]?,completion:@escaping (AnyObject?, Error?) -> Void) -> Void {
       
        requestResource(serviceURL: serviceURL, httpMethod: httpMethod, parameters: parameters, completion: completion)
    }
    
    private func requestResource(serviceURL:String,httpMethod:HttpMethod,parameters:[String:String]?,completion:@escaping (AnyObject?, Error?) -> Void) -> Void {
       
        var request = URLRequest(url: URL(string:"\(BaseURL)\(serviceURL)")!)
       
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        
        if (parameters != nil) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
        }
        
        let sessionTask = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
            
            if (data != nil){
                completion (data as AnyObject, nil)
            }
                
            if (error != nil) {
                completion (nil,error!)
            }
        }
        sessionTask.resume()
    }
}
