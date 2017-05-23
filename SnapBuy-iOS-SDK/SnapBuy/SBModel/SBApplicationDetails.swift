//
//  SBApplicationDetails.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBApplicationDetails: SBModel {
    
    var appID: NSNumber?
    var subscriptionID: Int?
    var name: String?
    
    public required init(dict: [String : AnyObject]) {
        self.appID = dict["appID"] as? NSNumber
        self.subscriptionID = dict["subscriptionID"] as? Int
        self.name = dict["name"] as? String
        
        super.init(dict: dict)
    }
}
