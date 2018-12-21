//
//  EventResponse.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/21.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit
import SwiftyJSON

struct EventResponse: ModelObject {
    
    var eventData: [EventData]
    
    static func decode(data: JSON) -> EventResponse {
        var eventDataArray: [EventData] = []
        let dataArray = data["events"].arrayValue
        dataArray.forEach {
            eventDataArray.append(EventData.decode(data: $0))
        }
        return EventResponse(eventData: eventDataArray)
    }
}

  
