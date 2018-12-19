//
//  ViewController.swift
//  GenericsPlactice
//
//  Created by 城島一輝 on 2018/12/16.
//  Copyright © 2018 城島一輝. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var apiSession: APISession = APISession()
    var userModel: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: Const.ATEND_USER)
//         call<T: ModelObject>(_ url: URL, success: (T) -> Void) {
        apiSession.call(url!) { (data) in
//SingletonURLRequest.dataTask(with: req) {(data, response, error) in
           
           print(data)
            
        }
        }
}


