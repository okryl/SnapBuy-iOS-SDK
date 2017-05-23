//
//  SBApplication.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBApplication: SBModel {
    
    var applicationID: Int?
    
    public required init(dict: [String : AnyObject]) {
        self.applicationID = dict["applicationID"] as? Int
        
        super.init(dict: dict)
    }
}
