//
//  SBVisualSearchRequest.swift
//  SnapBuy-Sample
//
//  Created by Omer on 20/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation
import UIKit

public struct SBVisualSearchRequest {
    
    //Application ID
    var appid: NSNumber!
    
    //URL of image (one of image or imageURL is required)
    var imageURL: String?
    
    //Local image for uploading (one of image or imageURL is required)
    var image: Data?
    
    //Product minimum price (if exists) for price filtering
    var minPrice: Double?
    
    //Product maximum price (if exists) for price filtering
    var maxPrice: Double?
    
    //Page number for pagination, default=1
    var page: Int?
    
    //Result count for pagination, default=4
    var itemsPerPage: Int?
    
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
    
    //If similarColor=true, SnapBuy will recognize the color automatically and search for similar colors.
    var similarColor: Bool?
    
    //You can send a color string. If you use color code, this string will effect similarity score, so you will likely get close colors.
    var color: String?
    
    //Image Tag String. SnapBuy tags your images automatically.You can send any string in English( for example Bag or Shoe), and SnapBuy will search for these tags. You can use multiple tags with comma (for example Bag,Purse)
    var tags: String?
    
    //Local Image Path
    fileprivate var pathImage: UIImage?
}

extension SBVisualSearchRequest: SBRequestable {
    
    var httpMethod: String {
        get { return "POST" }
    }
    
    var endpoint: String {
        get { return "images/search" }
    }
    
    var param: Parameters? {
        get { return toDict() }    }
    
    var paths: UIImage? {
        get { return pathImage }
    }
    
    //MARK: - Init
    
    init(withImageURL imageURL: String!, withAppId appId: NSNumber!) {
        self.imageURL = imageURL
        self.appid = appId
    }
    
    init(withLocalImage image: UIImage!, withAppId appId: NSNumber!) {
        self.image = image.jpeg
        self.appid = appId
        self.pathImage = image
    }
    
    private func toDict() -> [String:AnyObject] {
        var dict = [String:Any]()
        
        if self.appid == nil {
            fatalError("app id not be nil")
        }
        
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
        if let minPrice = self.minPrice {
            dict["minPrice"] = minPrice
        }
        if let maxPrice = self.maxPrice {
            dict["maxPrice"] = maxPrice
        }
        if let page = self.page {
            dict["page"] = page
        }
        if let itemsPerPage = self.itemsPerPage {
            dict["itemsPerPage"] = itemsPerPage
        }
        if let similarColor = self.similarColor {
            dict["similarColor"] = similarColor
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
