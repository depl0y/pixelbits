//
//  UIEdgeInsetsConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 17/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIEdgeInsetsConverter {
    
    /**
     Converts a value `insets(4, 4, 4, 4)` to a UIEdgeInsets struct
     
     - returns: A UIEdgeInsets object or nil if invalid
     */
    static func fromString(valueString: String) -> NSValue? {
        
        let expression = "insets\\(([0-9. ,a-zA-Z\\$\\-_]+?)\\)"
        
        let matches = valueString.variableValue().matches(expression)
        
        if matches.count == 0 {
            return nil
        }
        
        let insets = matches[0]
        let insetParts = insets.characters.split { $0 == "," }.map(String.init)
        var insetValues: [CGFloat] = []
        
        /**
        *  Check if all the inset values are convertible to NSNumber objects.
        */
        for index in 0..<insetParts.count {
            if let insetValue = insetParts[index].variableValue().toNumber() {
                insetValues.append(CGFloat(insetValue))
            }
			else {
				return nil;
			}
        }
        
        switch (insetValues.count) {
        case 1:
            return NSValue(UIEdgeInsets: UIEdgeInsetsMake(insetValues[0], insetValues[0], insetValues[0], insetValues[0]))
        case 2:
            return NSValue(UIEdgeInsets: UIEdgeInsetsMake(insetValues[0], insetValues[1], insetValues[0], insetValues[1]))
        case 4:
            return NSValue(UIEdgeInsets: UIEdgeInsetsMake(insetValues[0], insetValues[1], insetValues[2], insetValues[3]))
        default:
            return nil
        }
    }
    
}
