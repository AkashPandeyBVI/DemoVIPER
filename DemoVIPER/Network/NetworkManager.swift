//
//  NetworkManager.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 05/01/24.
//

import Foundation
import Alamofire

enum ConnectionError: Error{
    case badResponse
    case badStatusCode(Int)
    case badData
}

class NetworkManager {
    
    //variable
    static var shared = NetworkManager()
    
    //init
    private init() { }
}

//MARK: - Public
extension NetworkManager {
    
    func request<T:Codable>(url: String, method: HTTPMethod ,parameters: Parameters?, bodyParams: Parameters?,  headers: HTTPHeaders?, dataModelType: T.Type ,completion: @escaping (T?, Error?) -> ()) {
        var requestStr = "URL: \n \(url)\nParams: \(parameters ?? [:])\nHeaders: \(String(describing: headers))"
        
        AF.request(url, method: method, parameters:parameters, encoding:(parameters == nil) && (bodyParams != nil) ? JSONEncoding.default : URLEncoding(destination: .queryString), headers:nil, interceptor: nil ).responseData { resp in
            if let requestUrl = resp.request?.url {
                requestStr.append("\nRequestURL: \(requestUrl)")
            }
            if let respData = resp.data {
                do {
                    if let json = try? JSONSerialization.jsonObject(with: respData, options: .mutableContainers),
                       let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                        
                        print("\n======================================================================>\nREQUEST: \n\(requestStr) \n\nRESPONSE:\n\(String(decoding: jsonData, as: UTF8.self)) \n======================================================================>\n")
                    } else {
                        print("json data malformed")
                    }
                }
            }
            switch resp.result {
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode(T.self , from: data)
                    completion(data, nil)
                } catch let error {
                    completion(nil,error)
                }
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}

//MARK: - SVProgressHUD
extension NetworkManager {

    func showLoader() {
//        SVProgressHUD.show()
    }
    
    func hideLoader(_ timeDelay: Double = 1) {
        DispatchQueue.global(qos: .default).async {
            // time-consuming task
            DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
//                SVProgressHUD.dismiss()
            }
        }
    }
}
