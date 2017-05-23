//
//  SBAdultFilter.swift
//  SnapBuy-Sample
//
//  Created by Omer on 21/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBAdultFilter: SBModel {
    
    //#true if image has adult content
    var adult: Bool?
    
    var adultScore: Float?
    
    public required init(dict: [String : AnyObject]) {
        self.adult = dict["adult"] as? Bool
        self.adultScore = dict["adultScore"] as? Float
        
        super.init(dict: dict)
    }
}
