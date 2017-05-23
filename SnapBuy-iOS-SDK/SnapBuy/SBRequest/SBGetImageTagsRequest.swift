//
//  SBAdultFilteringRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 20/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

public struct SBGetImageTagsRequest {
    
    //URL of image	(one of image or imageURL is required)
    var imageURL: String?
    
    //Local image for uploading	(one of image or imageURL is required)
    var image: Data?
}

extension SBGetImageTagsRequest: SBRequestable {
    
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "images/get_labels" }
    }
    
    var param: Parameters? {
        get { return toDict() }  }
    
    var paths: UIImage? {
        get { return nil }
    }
    
    init(withImageURL imageURL: String!) {
        self.imageURL = imageURL
    }
    
    init(withImage image: Data!) {
        self.image = image
    }
    
    private func toDict() -> [String:AnyObject] {
        var dict = [String:Any]()
    
        if self.imageURL == nil && self.image == nil {
            fatalError("one of image or imageURL is required")
        }
        
        if let image = self.image {
            dict["image"] = image
            return dict as [String : AnyObject]
        }
        
        if let imageURL = self.imageURL {
            dict["imageURL"] = imageURL
        }
        
        return dict as [String : AnyObject]
    }
}
