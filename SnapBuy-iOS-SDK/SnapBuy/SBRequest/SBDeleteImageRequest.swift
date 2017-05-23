//
//  SBDeleteImageRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 20/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBDeleteImageRequest {
    
    var id: NSNumber
}

extension SBDeleteImageRequest: SBRequestable {
    
    var httpMethod: String {
        get { return "DELETE" }
    }
    
    var endpoint: String {
        get { return "images" }
    }
    
    var param: Parameters? {
        get { return ["id": id] }    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
