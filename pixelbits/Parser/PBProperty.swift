//
//  PBProperty.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class PBProperty: NSObject {
	
	var key: String
	var value: AnyObject
	var type: PBPropertyType = PBPropertyType.Other
	
	/// Is a `UIControlState` set for this property
	var controlState: UIControlState?
	
	init(key: String, value: AnyObject, type: PBPropertyType = PBPropertyType.Other) {
		
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
	
	func apply(view: UIView) {
		
		var applyValue = self.value
		
		if self.type == .Image {
			applyValue = UIImage(contentsOfFile: applyValue as! String)!
		}
		
		if self.controlState != nil && view.respondsToSelector(self.selector) {
			view.setValue(applyValue, forKey: key, forState: self.controlState!)
		}
		else if self.controlState == nil && view.respondsToSelector(self.selector) {
			view.setValue(applyValue, forKey: key)
		}
		else {
			Log.error("Could not apply '\(key)' to '\(view), property does not exist")
		}
		
	}
	
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

