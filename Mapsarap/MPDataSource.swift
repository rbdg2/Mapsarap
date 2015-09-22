//
//  MPDataSource.swift
//  Mapsarap
//
//  Created by RB de Guzman on 9/21/15.
//  Copyright (c) 2015 RB de Guzman. All rights reserved.
//

import Foundation

class MPDataSource : NSObject {
    private let sections = NSMutableArray()
    
    func addTitle(text : String) -> NSDictionary {
        for var index = 0; index < sections.count; ++index {
            let currentSection = sections[index] as! NSDictionary
            
            if let titleKey = currentSection.objectForKey("title") as? String {
                if titleKey == text {
                    println("Duplicate")
                    return currentSection
                }
            }
        }
        
        let title = NSDictionary(objects: [text, NSMutableArray(), NSMutableArray()], forKeys: ["title", "commands", "descriptions"])
        sections.addObject(title)
        return title
    }
    
    func addData(text : String, subtitle : String, atSection : String) -> NSDictionary {
        let section = addTitle(atSection)
        
        let commands = section.objectForKey("commands") as! NSMutableArray
        let descriptions = section.objectForKey("descriptions") as! NSMutableArray
        
        commands.addObject(text)
        descriptions.addObject(subtitle)
        return section
    }

    func addDataWithArrays(addedTexts : NSArray, addedDescriptions : NSArray, atSection : String) -> NSDictionary {
        let section = addTitle(atSection)
        
        let commands = section.objectForKey("commands") as! NSMutableArray
        let descriptions = section.objectForKey("descriptions") as! NSMutableArray
        
        commands.addObjectsFromArray(addedTexts as! [String])
        descriptions.addObjectsFromArray(addedDescriptions as! [String])
        return section
    }

    /* GETTERS METHOD */
    func allSections() -> NSArray {
        return NSArray(array: sections)
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRowsInSections(number : Int) -> Int {
        let section = sections[number] as! NSDictionary
        let commands = section.objectForKey("commands") as! NSMutableArray
        return commands.count
    }
    
    func titleForHeaderInSectionNumber(number : Int) -> String {
        let section = sections[number] as! NSDictionary
        let titleForHeader = section.objectForKey("title") as! String
        return titleForHeader
    }
    
    func commandForRow(row : Int, inSection: Int) -> String {
        let section = sections[inSection] as! NSDictionary
        let commands = section.objectForKey("commands") as! NSMutableArray
        let command = commands[row] as! String
        return command
    }
}