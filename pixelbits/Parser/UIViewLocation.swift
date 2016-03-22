//
//  PBPath.swift
//  pixelbits
//
//  Created by Wim Haanstra on 12/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

/**
	The `UIViewLocation` class describes the `location` of a `UIView` within it's parents' views.
 
	This will create a reference which can be used to reference in the stylesheets.
 */
internal class UIViewLocation : Hashable {
    
    var parent: UIViewLocation?
    var child: UIViewLocation?
    
    /// Stores the class name of the associated object.
    var className: String
    
    /// Stores the style of the associated object.
    var style: String?
    
    init(className: String, style: String? = nil, child: UIViewLocation?) {
        
        self.className = className
        self.style = style
        self.child = child
        
    }
    
    /**
     Returns the full path of this `UIViewLocation`. This is used for debugging.
     
     - returns: The full path of this `UIViewLocation`.
     */
    func toString() -> String {
        
        var result = ""
        
        if parent != nil {
            result = parent!.toString()
        }
        
        result += "/" + self.className
        
        if self.style != nil {
            result += "." + self.style!
        }
        
        return result
        
    }
    
    /// Returns the `className` of this `UIViewLocation`, suffixed with the `style` if specified.
    var fullName: String {
        get {
            var n = self.className
            if self.style != nil {
                n += "." + self.style!
            }
            
            return n
        }
    }
    
    /// Returns only the `style` property of the `UIViewLocation`, prefixed with a dot if a `style` is specified.
    var styleString: String {
        get {
            if self.style != nil {
                return ".\(self.style!)"
            }
            else {
                return ""
            }
        }
    }
    
    /**
     Get `UIViewLocation` for the supplied `UIView`.
     
     - parameter view:  The `UIView` for which to get the `UIViewLocation`
     - parameter child: If the `UIView` has a child `UIViewLocation` they will be linked together to create a valid hierarchy
     
     - returns: The `UIViewLocation` object
     */
    static func fromView(view: UIView, child: UIViewLocation? = nil) -> UIViewLocation {
        
        let mirror = Mirror(reflecting: view)
        let className: String = "\(mirror.subjectType)"
        
        let location = UIViewLocation(className: className, style: view.style, child: child)
        
        if view.superview != nil {
            let parent = UIViewLocation.fromView(view.superview!, child: location)
            location.parent = parent
        }
        else if view.viewController != nil {
            
            let viewController = view.viewController!
            let viewControllerMirror = Mirror(reflecting: viewController)
            let viewControllerClassName: String = "\(viewControllerMirror.subjectType)"
            
            let parent = UIViewLocation(className: viewControllerClassName, child: location)
            location.parent = parent
        }
        
        return location
        
    }
    
    /// Needed for the `Hashable` protocol
    var hashValue: Int {
        get {
            return self.toString().hashValue
        }
    }
    
}

func ==(lhs: UIViewLocation, rhs: UIViewLocation) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
