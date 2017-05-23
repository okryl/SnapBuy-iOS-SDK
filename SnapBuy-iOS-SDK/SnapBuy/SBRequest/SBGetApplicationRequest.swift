//
//  SBGetApplicationRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBGetlicationRequest {
    
    var id: NSNumber

}

extension SBGetlicationRequest: SBRequestable {
    
    var httpMethod: String {
        get { return "GET" }
    }
    
    var endpoint: String {
        get { return "applications/\(id)" }
    }
    
    var param: Parameters? {
        get { return ["id": id] }
    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
