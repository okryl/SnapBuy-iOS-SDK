//
//  SBUpdateApplicationRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBUpdateApplicationRequest {
    
    var id: NSNumber
    var name: String
    
}

extension SBUpdateApplicationRequest: SBRequestable {
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "applications/update" }
    }
    
    var param: Parameters? {
        get { return ["id": id,
                      "name":name] }
    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
