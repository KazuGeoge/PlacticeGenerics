//
//  ViewController.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
  
    var apiClient: APIClient = APIClient()
    var tableViewDataSouce: TableViewDataSouce = TableViewDataSouce()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tableViewDataSouce
        tableView.dataSource = tableViewDataSouce
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
   
    @IBAction func userButton(_ sender: Any) {
        loadAPIData(selectInfo: "ユーザー")
    }
    
    @IBAction func eventButton(_ sender: Any) {
        loadAPIData(selectInfo: "イベント")
    }
    
    // ユーザかイベントかでどちらかのクロージャを呼ぶ。帰ってきたらtableViewDataSoucecにオブジェクトを渡しリロードする。
    func loadAPIData(selectInfo: String) {
   
        if selectInfo == "ユーザー" {
            if let APIURL = URL(string: Const.ATEND_USER) {
                apiClient.call(APIURL) { (data: UsersResponse) in
                    self.tableViewDataSouce.userDataArray = data.usersData
                    self.tableViewDataSouce.eventTitle = data.title
                    self.tableViewDataSouce.isUserData = true
                    self.tableView.reloadData()
                }
            }
        } else {
            if let APIURL = URL(string: Const.ATEND_EVENTS) {
                apiClient.call(APIURL) { (data: EventResponse) in
                    self.tableViewDataSouce.eventDataArray = data.eventData
                    self.tableViewDataSouce.eventTitle = "イベント一覧"
                    self.tableViewDataSouce.isUserData = false
                    self.tableView.reloadData()
                }
            }
        }
    }
}
