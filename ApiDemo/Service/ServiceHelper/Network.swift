//
//  Network.swift
//  ApiDemo
//
//  Created by Mac Mini on 03/01/23.
//

import Foundation
import Alamofire

enum ParamVariables {
    static let get = "GET"
    static let post = "POST"
}

class Network {
   
    func apiCall(url: String,methodTypeString: String, params: [String:AnyObject]?, headers: HTTPHeaders?,success: @escaping (  _ parsedJSON: Data) -> Void, failed: @escaping (  _ errorMsg: String) -> Void) {

        let  methodType = HTTPMethod(rawValue: methodTypeString)
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 150 // seconds
        configuration.timeoutIntervalForResource = 150
        
        AF.request(url,method: methodType, parameters: params, headers: headers).responseData (completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        success(res)
                    default:
                        failed(response.debugDescription)
                    }
                }
            case .failure(let error):
                print(error)
                failed(error.errorDescription ?? "")
            }
        })
    }

    func apiCalling(URL: String , parameter: [String: Any], method: String, encoding: ParameterEncoding, success: @escaping(([String: Any]) -> ()), fail:@escaping((String) -> ())) {

        let token = "4f2f690370a82194ca242104a0c3a0d3387ae881c9f8a6164f68222169184c08"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer " + token
        ]
        
        print("headers:- \(headers)")
               print("param:- \(parameter)")
               print("URL:- \(URL)")
        
        AF.request(URL, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        print(response)
                        
                        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                            print(json)
                            success(json)
                        }
                        
                       /* guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            fail("error")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            fail("error")
                            return
                        }*/
                        
                        //     let loginResponse = try? JSONDecoder().decode(Detail.self, from: data)
                        
                     //   debugPrint(loginResponse)
                       
                        
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        fail("error")
                        return
                    }
                case .failure(let error):
                    print(error)
                fail("error")
            }
        }
    }
}
