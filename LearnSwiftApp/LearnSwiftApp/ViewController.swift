//
//  ViewController.swift
//  LearnSwiftApp
//
//  Created by admin on 2019/4/1.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var params = Dictionary<String, Any>()
        
        params["platform"] = 0
        params["page"] = 1
        
        Alamofire.request("http://mygq.test.gq.com.cn/v2/gq/article/list",
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response) in
                
                print(response.result.value!)
                
        }
    }
}

