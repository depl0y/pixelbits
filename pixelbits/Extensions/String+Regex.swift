//
//  String+Regex.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

extension String {
    
    /**
     Performs a regular expression on the current string and returns the matches as `Strings`.
     
     - parameter pattern: The regular expression that needs to be performed
     
     - returns: An array of `String` objects if any matches are found, otherwise an empty array.
     */
    func matches(pattern: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let nsstring = self as NSString
            
            let results = regex.matchesInString(self, options: [], range: NSMakeRange(0, nsstring.length))
            
            return results.map { nsstring.substringWithRange($0.rangeAtIndex(1)) }
        }
        catch let error as NSError {
            
            Log.error("\(error) occured")
            
            return []
        }
        
    }
    
    
    internal func variableValue() -> String {
        if self.hasPrefix("$") {
            return Pixelbits.sharedInstance.rootNodes.variables.valueForVariable(self.trim())
        }
        else {
            return self.trim()
        }
    }
    
    
    /**
     Trims whitespaces and newlines from the start and end of the current string
     
     - returns: A string without
     */
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /**
     Uses an `NSNumberFormatter` to cast a String to an `NSNumber`.
     
     - returns: An `NSNumber` when the cast succeeds, otherwise `nil`.
     */
    func toNumber() -> NSNumber? {
        return NSNumberFormatter().numberFromString(self)
    }
    
}
