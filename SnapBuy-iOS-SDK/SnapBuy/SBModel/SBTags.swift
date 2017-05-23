//
//  SBTags.swift
//  SnapBuy-Sample
//
//  Created by Omer on 21/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

class SBTags: NSObject {
  
    var name: String?
    var confidence: Float?
    
    required init(dict: [String : AnyObject]) {
        self.name = dict["name"] as? String
        self.confidence = dict["confidence"] as? Float
    }
}

//Image Tag String. SnapBuy tags your images automatically.You can send any string in English( for example Bag or Shoe), and SnapBuy will search for these tags. You can use multiple tags with comma (for example Bag,Purse)
