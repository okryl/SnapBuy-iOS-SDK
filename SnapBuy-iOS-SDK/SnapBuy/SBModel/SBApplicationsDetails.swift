//
//  SBApplicationsDetails.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBApplications: SBModel {
    
    var applications = [SBApplicationDetails]()
    
    public required init(dict: [String : AnyObject]) {
        if let applicationsArray = dict["applications"] as? NSArray {
            for sbApplicationDetails in applicationsArray {
                let sbApplicationDetailsObject = SBApplicationDetails(dict: sbApplicationDetails as! [String : AnyObject])
                self.applications.append(sbApplicationDetailsObject)
            }
        }
       
        super.init(dict: dict)
    }
}
