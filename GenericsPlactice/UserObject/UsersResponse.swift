//
//  UsersArray.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/20.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol ModelObject {
    static func decode(data: JSON) -> Self
}

struct UsersResponse: ModelObject {
    
     var usersData: [UsersData]
     var title: String?
    
    static func decode(data: JSON) -> UsersResponse {
        var usersDataArray: [UsersData] = []
        let title = data["events"][0]["event"]["title"].string
        let dataArray = data["events"][0]["event"]["users"].arrayValue
        
        dataArray.forEach {
            usersDataArray.append(UsersData.decode(data: $0))
        }
        return UsersResponse(usersData: usersDataArray, title: title)
    }
}
