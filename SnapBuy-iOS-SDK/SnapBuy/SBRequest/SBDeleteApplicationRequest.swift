//
//  SBDeleteApplicationRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 18/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBDeleteApplicationRequest {
    
    var id: NSNumber
    
}

extension SBDeleteApplicationRequest:SBRequestable {
    var httpMethod: String {
        get { return "DELETE" }
    }
    
    var endpoint: String {
        get { return "applications" }
    }
    
    var param: Parameters? {
        get { return ["id": id] }
    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
