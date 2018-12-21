//
//  APISession.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import Alamofire
import SwiftyJSON

class APIClient: NSObject {
    
    func call<T: ModelObject>(_ url: URL, success: @escaping (T) -> Void) {
        
         Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseData{ response in
            
            switch response.result {
            case .success:
                
                if let value = response.result.value {
                    let jsonData = JSON(value)
                 
                    success(T.decode(data: jsonData))
                }
                
            case . failure(let error):
                print(error)
            }
        }
    }
}
