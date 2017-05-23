//
//  SBGetApplicationsRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

struct SBGetlicationsRequest {}

extension SBGetlicationsRequest: SBRequestable {
    var httpMethod: String {
        get { return "GET" }
    }
    
    var endpoint: String {
        get { return "applications" }
    }
    
    var param: Parameters? {
        get { return nil }
    }
    
    var paths: UIImage? {
        get { return nil }
    }
}
