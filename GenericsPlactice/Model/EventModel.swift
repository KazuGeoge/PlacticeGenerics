//
//  EventModel.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import SwiftyJSON

struct EventModel {
    var title: String?
    var event_url: String?

    init(title: String, event_url: String) {
        self.title = title
        self.event_url = event_url
    }
    
    init(json: JSON) {
        self.title = json["events"]["event"].string
        self.event_url = json["events"]["event"].string
    }
}
