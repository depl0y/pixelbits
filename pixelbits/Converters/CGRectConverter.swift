//
//  CGRectConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class CGRectConverter {
    
    /**
     Converts a value `rect(4, 4, 4, 4)` to a CGRect struct
     
     - returns: A CGRect object or nil if invalid
     */
    static func fromString(valueString: String) -> NSValue? {
        
        let expression = "rect\\(([0-9. ,a-zA-Z\\$\\-_]+?)\\)"
        
        let matches = valueString.variableValue().matches(expression)
        
        if matches.count == 0 {
            return nil
        }
        
        let insets = matches[0]
        let rectParts = insets.characters.split { $0 == "," }.map(String.init)
        var rectValues: [CGFloat] = []
        
        /**
        *  Check if all the values are convertible to NSNumber objects.
        */
        for index in 0..<rectParts.count {
            if let rectValue = rectParts[index].variableValue().toNumber() {
                rectValues.append(CGFloat(rectValue))
            }
			else {
				return nil;
			}
        }
        
        switch (rectValues.count) {
        case 1:
            return NSValue(CGRect: CGRectMake(rectValues[0], rectValues[0], rectValues[0], rectValues[0]))
        case 2:
            return NSValue(CGRect: CGRectMake(rectValues[0], rectValues[1], rectValues[0], rectValues[1]))
        case 4:
            return NSValue(CGRect: CGRectMake(rectValues[0], rectValues[1], rectValues[2], rectValues[3]))
        default:
            return nil
        }
        
    }
    
    
}
