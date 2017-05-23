//
//  SBCheckImageIndexedRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBCheckImageIndexedRequest {
    
    var imageURL: String
    var appid: NSNumber
    
}

extension SBCheckImageIndexedRequest: SBRequestable {
    
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "images/check" }
    }
    
    var param: Parameters? {
        get { return ["imageURL": imageURL,
                      "appid":appid] }
    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
