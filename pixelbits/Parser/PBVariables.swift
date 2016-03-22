//
//  PBVariables.swift
//  pixelbits
//
//  Created by Wim Haanstra on 23/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class PBVariables {

    private var variables = Dictionary<String, String>()
    
    internal func add(key: String, value: String) {
        
        if self.hasVariable(key) {
            Log.info("Overwriting variable \(key)")
            self.removeDefinition(key)
        }
        
        Log.debug("Setting variable for \(key) to \(value)")
        self.variables[key] = value
        
    }
    
    internal func valueForVariable(variable: String) -> String {
        
        if !self.hasVariable(variable) {
            return variable
        }
        else {
            return self.variables[variable]!
        }
        
    }
    
    internal func hasVariable(key: String) -> Bool {
        return self.variables[key] != nil
    }
    
    private func removeDefinition(key: String) {
        self.variables.removeValueForKey(key)
    }
    
}
