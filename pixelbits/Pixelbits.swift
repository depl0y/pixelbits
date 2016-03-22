//
//  Pixelbits.swift
//  pixelbits
//
//  Created by Wim Haanstra on 20/12/15.
//  Copyright © 2015 Wim Haanstra. All rights reserved.
//

import UIKit

/// Pixelbits
public class Pixelbits {
    
    static let sharedInstance = Pixelbits()
    
    /// Stores the paths of the stylesheets added to Pixelbits
    internal var stylesheets = Array<String>()
    
    /// Stores the rootnodes of the stylesheet
    internal var rootNodes = PBNodeCollection()
    
    private init() {
        
        Log.logLevel = (self.debug) ? 0 : 2
        Swizzling.setup()
        
    }
    
    /// Turns Pixelbits logging on or off.
    public var debug: Bool = true {
        didSet {
            Log.logLevel = (self.debug) ? 0 : 2
        }
    }
    
    /**
     Add a stylesheet to Pixelbits, this stylesheet will also be loaded
     
     - parameter stylesheet: The name of the stylesheet file in the mainBundle
     
     - throws: Throws an error when the file could not be loaded.
     */
    public class func addStylesheet(stylesheet: String) throws {
        
        guard let resourceName = NSBundle.mainBundle().pathForResource(stylesheet, ofType: nil) else {
            Log.error("Stylesheet \(stylesheet) does not exist in bundle")
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotOpenFile, userInfo: nil)
        }
        
        Pixelbits.sharedInstance.stylesheets.append(resourceName)
        Log.debug("Loaded stylesheet \(stylesheet)")
        
        Pixelbits.sharedInstance.loadStylesheets()
    }
    
    /**
     Add multiple stylesheets at once to Pixelbits, they are loaded
     in the order they are supplied.
     
     - parameter stylesheets: Filenames of the stylesheets that are loaded
     
     - throws: Throws an error when the file could not be loaded.
     */
    public class func addStylesheets(stylesheets: [String]) throws {
        
        stylesheets.forEach {
            try! Pixelbits.addStylesheet($0)
        }
        
    }
    
    /**
     Apply a style to a single view.
     
     - parameter view: The view where the styles need to be applied to
     */
    public func applyStyle(view: UIView) {
        
        guard !view.updatingStyle else {
            return
        }
        
        view.updatingStyle = true
        
        let location = UIViewLocation.fromView(view)
        let style = self.rootNodes.compileNodeForLocation(location)
        style.apply(view)
        
        view.updatingStyle = false
    }
    
    /**
     Loads stylesheets in memory and parses them.
     */
    private func loadStylesheets() {
        
        Pixelbits.sharedInstance.stylesheets.forEach {
            
            if let jsonData = NSData(contentsOfFile: $0) {
                if let jsonResult = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? Dictionary<String, AnyObject> {
                    rootNodes.loadStylesheet(jsonResult)
                }
            }
            
        }
        
        Log.debug("Nodes loaded: \(self.rootNodes.count)")
    }
    
}
