//
//  EventData.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/21.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit
import SwiftyJSON

struct EventData: ModelObject {
    
    var title: String?
    var event_url: String?
    
    init(title: String, event_url: String) {
        self.title = title
        self.event_url = event_url
    }
    
    init(json: JSON) {
        self.title = json["event"]["title"].string
        self.event_url = json["event"]["event_url"].string
    }
    
    static func decode(data: JSON) -> EventData {
        
        return EventData(json: data)
    }
}
