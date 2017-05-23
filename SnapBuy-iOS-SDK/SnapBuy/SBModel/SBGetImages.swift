//
//  SBGetImages.swift
//  SnapBuy-Sample
//
//  Created by Omer on 21/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBGetImages: SBModel {
    //(float), #Similarity score
    var score: Float?
    
    //Application ID
    var application: String?
    
    //Page number for pagination, default=1
    var imageURL: String?
    
    //Result count for pagination, default=4
    var thumbnail: String?
    
    //Image Title
    var subscriber: Int?
    
    var tags: [SBTags]?
    
    var metadata: String?
    
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
    
    var url: String?
    
    var title: String?
    
    //Image Description
    var desc: String?
    
    //Product Price
    var price: Double?
   
    var currency: String?
    
    var tagString: String?
    
    var imageID: String?
    
    var colors: String?

    
    public required init(dict: [String : AnyObject]) {
        self.score = dict["score"] as? Float
        self.application = dict["application"] as? String
        self.imageURL = dict["imageURL"] as? String
        self.thumbnail = dict["thumbnail"] as? String
        self.subscriber = dict["subscriber"] as? Int
        self.metadata = dict["metadata"] as? String
        self.c1 = dict["c1"] as? String
        self.c2 = dict["c2"] as? String
        self.c3 = dict["c3"] as? String
        self.c4 = dict["c4"] as? String
        self.c5 = dict["c5"] as? String
        self.url = dict["url"] as? String
        self.title = dict["title"] as? String
        self.desc = dict["description"] as? String
        self.price = dict["price"] as? Double
        self.currency = dict["currency"] as? String
        self.tagString = dict["tag_string"] as? String
        self.imageID = dict["image_id"] as? String
        self.colors = dict["colors"] as? String

        let tagsArray = dict["tags"] as? NSArray
        
        if tagsArray?.count != nil {
            self.tags = [SBTags]()
            
            for tags in tagsArray! {
                let tag = SBTags(dict: tags as! [String : AnyObject])
                self.tags?.append(tag)
            }
        }
        
        super.init(dict: dict)
    }
}
