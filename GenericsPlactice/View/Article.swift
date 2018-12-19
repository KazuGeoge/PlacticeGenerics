//
//  Article.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol ModelObject {
    func decode(data: Data) -> Self
}

struct Article: ModelObject {
    
    func decode(data: Data) -> Article {
        
        var userModel: [UserModel] = []
        let json = JSON(data)
        let eventJson = json
        eventJson["events"][0]["event"]["users"].forEach { (_, json) in
            let content = UserModel(json: json)
            userModel.append(content)
        }
        return self
    }
}
