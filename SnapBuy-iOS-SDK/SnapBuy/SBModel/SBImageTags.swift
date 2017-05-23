//
//  SBImageTags.swift
//  SnapBuy-Sample
//
//  Created by Omer on 21/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBImageTags: SBModel {
    
    var tagString: String?
    
    var tags: [SBTags]?
    
    public required init(dict: [String : AnyObject]) {
        let tagsArray = dict["tags"] as? NSArray
        
        if tagsArray?.count != nil {
            self.tags = [SBTags]()
            
            for tags in tagsArray! {
                let tag = SBTags(dict: tags as! [String : AnyObject])
                self.tags?.append(tag)
            }
        }
        
        self.tagString = dict["tag_string"] as? String
        
        super.init(dict: dict)
    }
}
