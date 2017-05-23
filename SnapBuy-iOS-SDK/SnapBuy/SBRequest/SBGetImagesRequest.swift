//
//  SBGetImagesRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 20/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

public struct SBGetImagesRequest {
    
    //Application ID
    var appid: NSNumber!
    
    //Page number for pagination, default=1
    var page: Int?
    
    //Result count for pagination, default=4
    var itemsPerPage: Int?
    
    //Image Title
    var title: String?
    
    //Image Description
    var description: String?
    
    //You can get active or passive images
    var passive: Bool?
    
    //Product Price
    var price: Double?
    
    //Image Category 1
    var c1: String?
    
    //Image Category 2
    var c2: String?
    
    //Image Category 3
    var c3: String?
    
    //Image Category 4
    var c4: String?
    
    //Image Category 5
    var c5: String?
    
    //Image ID
    var id: String?

    //Color code for image filtering. Every image has 3 color codes, you can search images for these color codes. You can use X11 Color Set (http://cng.seas.rochester.edu/CNG/docs/x11color.html)
    var color: String?
    
    //Image Tag String. SnapBuy tags your images automatically.You can send any string in English( for example Bag or Shoe), and SnapBuy will search for these tags. You can use multiple tags with comma (for example Bag,Purse)
    var tags: String?
}

extension SBGetImagesRequest: SBRequestable {
    
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "images/get_images" }
    }
    
    var param: Parameters? {
        get { return toDict() }    }
    
    var paths: UIImage? {
        get { return nil }
    }
    
   init(withAppID appID: NSNumber!) {
        self.appid = appID
    }
    
    private func toDict() -> [String:AnyObject] {
        var dict = [String:Any]()
        
        if self.appid == nil {
            fatalError("app id not be nil")
        }
        
        dict["appid"] = self.appid!
        
        
        if let page = self.page {
            dict["page"] = page
        }
        if let itemsPerPage = self.itemsPerPage {
            dict["itemsPerPage"] = itemsPerPage
        }
        if let title = self.title {
            dict["title"] = title
        }
        if let description = self.description {
            dict["description"] = description
        }
        if let passive = self.passive {
            dict["passive"] = passive
        }
        if let price = self.price {
            dict["price"] = price
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
        if let id = self.id {
            dict["id"] = id
        }
        if let color = self.color {
            dict["color"] = color
        }
        if let tags = self.tags {
            dict["tags"] = tags
        }
        
        return dict as [String : AnyObject]

    }
}
