//
//  SBModel.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBModel: NSObject {
    
    public var statusText: String?
    public var errorMessage: String?
    
    public required init(dict: [String:AnyObject]) {
        self.statusText = dict["statusText"] as? String
        self.errorMessage = dict["errorMessage"] as? String
    }
    
}
