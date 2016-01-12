//
//  PBProperty.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

public class PBProperty: NSObject {

	public var key: String
	public var value: AnyObject
	public var type: PBPropertyType = PBPropertyType.Other
	
	public var controlState: UIControlState?
	
	public init(key: String, value: AnyObject, type: PBPropertyType = PBPropertyType.Other) {
		
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
		
		self.value = value
		self.type = type
		
		super.init()
	}
	
	public func apply(view: UIView) {
		
		if (view.className != nil) {
			Log.debug("\(view.className!).\(key)")
		}
		
		var applyValue = self.value
		
		if self.type == .Image {
			applyValue = UIImage(contentsOfFile: applyValue as! String)!
		}
		
		if self.controlState != nil {
			view.setValue(applyValue, forKey: key, forState: self.controlState!)
		}
		else {
			let sel = Selector(key)
			
			if view.respondsToSelector(sel) {
				view.setValue(applyValue, forKey: key)
			}
			else {
				if (view.className != nil) {
					Log.error("Could not apply '\(key)' to '\(view.className!)', property does not exist")
				}
			}
		}
		
	}
	
}

public enum PBPropertyType: Int {
	case Color = 0
	case Image
	case Font
	case TextAlignment
	case Other
}