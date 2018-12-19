//
//  APISession.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import Alamofire

class APISession: NSObject {
    
     var article: ModelObject = Article()
    
    func call<T>(_ url: URL, success: (T) -> Void) {
        
         Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseData{ response in
            
            switch response.result {
            case .success:
                
                if let value = response.result.value {
//                    let a = self.article.decode(data: value)
                    success(self.article.decode(data: value))
                }
                
            case . failure(let error):
                print(error)
            }
        }
    }
}
