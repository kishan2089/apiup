//
//  HomeServices.swift
//  ApiDemo
//
//  Created by Mac Mini on 03/01/23.
//

import Foundation
import Alamofire

class HomeServices {
    
    func getCategory(success: @escaping([GetUsersModel]) -> Void, failure: @escaping(String) -> Void) {
        let token = "4f2f690370a82194ca242104a0c3a0d3387ae881c9f8a6164f68222169184c08"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer " + token
        ]
        
        Network().apiCall(url: UrlString.BASE_URL, methodTypeString: ParamVariables.get, params: nil, headers: headers) { response in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([GetUsersModel].self, from: response)
                success(responseModel)
            } catch let error {
                failure(TextString().errorMessage)
                print(error)
            }
        } failed: { error in
            failure(error)
        }
    }
    
    func getAddUSer(paramater: [String: AnyObject], success: @escaping(AddUserModel) -> Void, failure: @escaping(String) -> Void) {
        let token = "4f2f690370a82194ca242104a0c3a0d3387ae881c9f8a6164f68222169184c08"
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer " + token
        ]
        
        Network().apiCall(url: UrlString.BASE_URL, methodTypeString: ParamVariables.post, params: paramater, headers: headers) { response in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddUserModel.self, from: response)
                success(responseModel)
            } catch let error {
                print(error)
                failure(TextString().errorMessage)
            }
        } failed: { error in
            failure(error)
        }
    }
}
