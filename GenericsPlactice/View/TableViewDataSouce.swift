//
//  TableViewDataSouceTableViewController.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/21.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit

class TableViewDataSouce: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var userDataArray: [UsersData] = []
    var eventDataArray: [EventData] = []
    var eventTitle: String?
    var isUserData: Bool?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return eventTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isUserData == true {
            return userDataArray.count
        } else {
            return eventDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if isUserData == true {
            cell.textLabel?.text = userDataArray[indexPath.row].nickname
        } else {
            cell.textLabel?.text = eventDataArray[indexPath.row].title
        }
        return cell
    }
}
