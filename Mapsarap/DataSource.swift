//
//  DataSource.swift
//  Mapsarap
//
//  Created by RB de Guzman on 9/21/15.
//  Copyright (c) 2015 RB de Guzman. All rights reserved.
//

import Foundation

class DataSource : NSObject {
    let sections = NSMutableDictionary()
    
    func addSection(name : String) {
        if let existingSection: AnyObject = sections.objectForKey(name) as? NSDictionary {
            return
        }
        
        let section = NSDictionary(objects: [NSMutableArray(), NSMutableArray()], forKeys: ["titles", "subtitles"])
        sections.setObject(section, forKey: name)
    }
    
    func addTitle(title : String, subtitle : String, atSection : String) {
        addSection(atSection)
        
        let section = sections.objectForKey(atSection) as! NSDictionary
        let titles = section.objectForKey("titles") as! NSMutableArray
        titles.addObject(title)

        let subtitles = section.objectForKey("subtitles") as! NSMutableArray
        subtitles.addObject(subtitle)
    }
    
    //Getter
    func titles(section : String) -> NSArray {
        //TODO: Add handler when section does not exist
        
        let section = sections.objectForKey(section) as! NSDictionary
        let titles = section.objectForKey("titles") as! NSMutableArray
        
        return NSArray(array: titles)
    }
    
    func subtitles(section : String) -> NSArray {
        //TODO: Add handler when section does not exist
        
        let section = sections.objectForKey(section) as! NSDictionary
        let titles = section.objectForKey("subtitles") as! NSMutableArray
        
        return NSArray(array: titles)
    }
}