//
//  BooleanConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

/// Converter that tries to convert a string to a boolean.
internal class BooleanConverter: Converter {
    
    /**
     Tries to convert a string to a Bool value, based on `ConverterValues`.
     
     - parameter value: A string that needs to be converted
     
     - returns: A bool when the conversion is succesful, otherwise nil.
     */
    static func fromString(value: String) -> Bool? {
        return ConverterValues.BooleanValues[value.variableValue()]
    }
    
    /**
     Converter that tries to convert a Bool value to a string based on the first hit in `ConverterValues`.
     
     - parameter value: A bool value to convert to a String
     
     - returns: A string if succesful, otherwise nil
     */
    static func toString(value: Bool) -> String? {
        if let index = ConverterValues.BooleanValues.indexOf( { $0.1 == value } ) {
            return ConverterValues.BooleanValues[index].0
        }
        return nil
    }
    
}
