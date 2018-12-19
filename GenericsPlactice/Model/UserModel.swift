//
//  UserModel.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import SwiftyJSON

struct UserModel {
    var nickname: String?
    var user_id: Int?
    
    init(nickname: String, user_id: Int) {
        self.nickname = nickname
        self.user_id = user_id
    }
    
    init(json: JSON) {
        self.nickname = json["user"]["nickname"].string
        self.user_id = json["user"]["user_id"].int
    }
}
