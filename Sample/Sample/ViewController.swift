//
//  ViewController.swift
//  Sample
//
//  Created by 李二狗 on 2018/3/6.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import iPromise

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    var isFetching = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        fetch()
    }
    
    func fetch() {
        guard !isFetching else {
            output("Fetching ... try again later")
            return
        }
        
        isFetching = true
        
        APIClient.fetchUserInfo().then { user in
            output("User Info : \(user)")
            }.onError { e in
                output("An error occured : \(e)")
            }.finally {
                output("Everything is done <3")
                self.isFetching = false
        }
    }

}

