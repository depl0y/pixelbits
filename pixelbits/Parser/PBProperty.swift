//
//  PBProperty.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class PBProperty: NSObject {
    
    /// The key for this property
    var key: String = ""
    
    /// A value for the `PBProperty`.
    var value: AnyObject
    
    /// The type of the property, used to parse certain values.
    var type: PBPropertyType = PBPropertyType.Other
    
    /// Is a `UIControlState` set for this property
    var controlState: UIControlState?
    
    init(key: String, value: AnyObject, type: PBPropertyType = PBPropertyType.Other) {
        
        self.value = value
        self.type = type
        
        super.init()
        
        self.parseKey(key)
    }
    
    /**
     Apply this property to the specified `UIView` object.
     
     - parameter view: The `UIView` object which this property should be applied to.
     */
    func apply(view: UIView) {
        
        if self.controlState != nil && view.respondsToSelector(self.selector) {
            
            do {
                try SwiftExceptionHandling.performBlock { () -> Void in
                    view.setValue(self.value, forKey: self.key, forState: self.controlState!)
                }
            } catch {
                Log.error("Error while setting value for \(self.key) on \(view)")
            }
            
        }
        else if self.controlState == nil && view.respondsToSelector(self.selector) {
            
            do {
                try SwiftExceptionHandling.performBlock { () -> Void in
                    view.setValue(self.value, forKey: self.key)
                }
            } catch {
                Log.error("Error while setting value for \(self.key) on \(view)")
            }
            
        }
        else {
            if self.key == "hidden" && self.type == .Boolean {
                view.hidden = self.value as! Bool
            }
            else if self.key == "userInteractionEnabled" && self.type == .Boolean {
                view.userInteractionEnabled = self.value as! Bool
            }
            else {
                Log.error("Could not apply '\(key)' to '\(view), property does not exist")
            }
        }
        
    }
    
    /**
     Parses the `key` of this property, for example when a control state is also supplied
     
     - parameter key: The key that needs to be parsed.
     */
    private func parseKey(key: String) {
        if key.containsString(":") {
            var keyParts = key.characters.split { $0 == ":" }.map(String.init)
            
            if keyParts.count == 2 {
                self.controlState = UIControlStateConverter.fromString(keyParts[1])
                self.key = keyParts[0]
            }
            else {
                self.key = key
            }
        }
        else {
            self.key = key
        }
    }
    
    /// Returns the selector that will be called for this property.
    private var selector: Selector {
        if self.controlState != nil {
            let selectorString = "set\(self.key):forState:"
            return Selector(selectorString)
        }
        else {
            return Selector(self.key)
        }
    }
    
    
    
}

