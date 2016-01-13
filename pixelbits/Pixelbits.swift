//
//  Pixelbits.swift
//  pixelbits
//
//  Created by Wim Haanstra on 20/12/15.
//  Copyright © 2015 Wim Haanstra. All rights reserved.
//

import UIKit

public class Pixelbits {

	static let sharedInstance = Pixelbits()
	private var stylesheets = Array<String>()
	
	private var rootNodes = PBNodeCollection()
	
	private init() {
		
		Log.logLevel = (self.debug) ? 0 : 2
		
	}
	
	public var debug: Bool = true {
		didSet {
			Log.logLevel = (self.debug) ? 0 : 2
		}
	}
	
	public class func addStylesheet(stylesheet: String) throws {

		guard let resourceName = NSBundle.mainBundle().pathForResource(stylesheet, ofType: nil) else {
			Log.error("Stylesheet \(stylesheet) does not exist in bundle")
			throw NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotOpenFile, userInfo: nil)
		}

		Pixelbits.sharedInstance.stylesheets.append(resourceName)
		Log.debug("Loaded stylesheet \(stylesheet)")
		
		Pixelbits.sharedInstance.loadStylesheets()
	}
	
	
	public class func addStylesheets(stylesheets: [String]) throws {
		
		stylesheets.forEach {
			try! Pixelbits.addStylesheet($0)
		}
		
	}

	public func applyStyle(view: UIView) {
		
		let location = UIViewLocation.fromView(view)
		Log.debug(location.toString())
		
		let style = self.rootNodes.compileNodeForLocation(location)
		style.apply(view)
	}
	
	private func loadStylesheets() {
		
		Pixelbits.sharedInstance.stylesheets.forEach {
			
			if let jsonData = NSData(contentsOfFile: $0) {
				if let jsonResult = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? Dictionary<String, AnyObject> {
					
					let nodes = PBNode.load(jsonResult)
					rootNodes.appendContentsOf(nodes)
				}
			}
			
		}
		
		Log.debug("Nodes loaded: \(self.rootNodes.count)")
	}
	
}
