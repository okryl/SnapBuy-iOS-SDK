//
//  SBIndexNewImageRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 19/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

public struct SBIndexNewImageRequest {
    var imageURL: String?
    var pathImage: UIImage?
    var appid: NSNumber!
    var c1: String?
    var c2: String?
    var c3: String?
    var c4: String?
    var c5: String?
    var metaData: String?
    var title: String?
    var description: String?
    var price: Double?
    var url: String?
    var currency: String?
    var passive: Bool?
    fileprivate var image: Data?
}

extension SBIndexNewImageRequest: SBRequestable {
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "images" }
    }
    
    var param: Parameters? {
        get { return toDict() }
    }
    
    var paths: UIImage? {
        get {return pathImage}
    }
    
    //MARK: - Init
    
    init(withImageURL imageURL: String?, withAppId appId: NSNumber!) {
        self.imageURL = imageURL
        self.appid = appId
    }
    
    init(withLocalImage image: UIImage!, withAppId appId: NSNumber!) {
        self.image = image.jpeg
        self.appid = appId
        self.pathImage = image
    }
    
    //MARK : Params
    
    private func toDict() -> [String:AnyObject] {
        var dict = [String:Any]()
        
        dict["appid"] = appid
        
        if self.imageURL == nil && self.image == nil {
            fatalError("one of image or imageURL is required")
        }
        
        if let imageURL = self.imageURL {
            dict["imageURL"] = imageURL
        }
        if let image = self.image {
            dict["image"] = image
        }
        if let c1 = self.c1 {
            dict["c1"] = c1
        }
        if let c1 = self.c1 {
            dict["c1"] = c1
        }
        if let c2 = self.c2 {
            dict["c2"] = c2
        }
        if let c3 = self.c3 {
            dict["c3"] = c3
        }
        if let c4 = self.c4 {
            dict["c4"] = c4
        }
        if let c5 = self.c5 {
            dict["c5"] = c5
        }
        if let metaData = self.metaData {
            dict["metaData"] = metaData
        }
        if let description = self.description {
            dict["description"] = description
        }
        if let price = self.price {
            dict["price"] = price
        }
        if let url = self.url {
            dict["url"] = url
        }
        if let currency = self.currency {
            dict["currency"] = currency
        }
        if let passive = self.passive {
            dict["passive"] = passive
        }
        
        return dict as [String : AnyObject]
    }
    
}

extension UIImage {
    var jpeg: Data? {
        return UIImageJPEGRepresentation(self, 1)   // QUALITY min = 0 / max = 1
    }
    var png: Data? {
        return UIImagePNGRepresentation(self)
    }
}

