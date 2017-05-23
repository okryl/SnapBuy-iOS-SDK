//
//  SBApplicationRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 17/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBApplicationRequest {
    
    var name: String
    
}

extension SBApplicationRequest: SBRequestable {
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "applications" }
    }
    
    var param: Parameters? {
        get { return ["name": name] }
    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
