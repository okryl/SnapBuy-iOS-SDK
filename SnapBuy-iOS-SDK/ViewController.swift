//
//  ViewController.swift
//  SnapBuy-iOS-SDK
//
//  Created by Omer on 24/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //Sample
        SBService.shared.setApplicationKey("Your Api Key")
        
        SBService.shared.createApplication(withName: "App Name", success: { (s) in
            
        }) { (f) in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

