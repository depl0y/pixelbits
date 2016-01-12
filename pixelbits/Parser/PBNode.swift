//
//  PBNode.swift
//  pixelbits
//
//  Created by Wim Haanstra on 10/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

public class PBNode: NSObject {
	
	/// Parent `PBNode` for this node, nil if found in the root of the stylesheet.
	var parentNode: PBNode?
	
	var key: String
	
	var nodes = Array<PBNode>()
	
	var subViewNodes = Array<PBNode>()

	var properties = Array<PBProperty>()
	
	init(key: String, parent: PBNode? = nil) {
		
		self.key = key
		self.parentNode = parent
		
		super.init()
		
	}
	
	init(key: String, style: Dictionary<String, AnyObject>, parent: PBNode? = nil) {
		
		self.key = key
		self.parentNode = parent
		
		super.init()
		
		self.load(style)
	}
	
	class func load(dictionary: Dictionary<String, AnyObject>) -> Array<PBNode> {
		
		var result = Array<PBNode>()
		
		for (key, value) in dictionary {
			
			if let childDictionary = value as? Dictionary<String, AnyObject> {
				
				let node = PBNode(key: key, style: childDictionary)
				result.append(node)
				
			}
			
		}
		
		return result
		
	}
	
	func load(style: Dictionary<String, AnyObject>) {
		
		self.properties.removeAll()
		self.nodes.removeAll()
		
		
		Log.debug("Loading style for \(key)")
		Log.debug("\(style)")
		
		
		if style.keys.count == 0 {
			Log.error("Loading with key \(self.key) failed, styling missing")
			return
		}
		
		let replacedStyle = self.replaceKeys(style)
		
		for (key, value) in replacedStyle {
			
			if let childDictionary = value as? Dictionary<String, AnyObject> {
				
				let childNode = PBNode(key: key, style: childDictionary, parent: self)
				
				if key.hasPrefix("@") {
					childNode.key = key.substringFromIndex(key.startIndex.advancedBy(1))
					self.subViewNodes.append(childNode)
				}
				else {
					self.nodes.append(childNode)
				}
				
			}
			
			if let valueString = value as? String {
				
				if let color = UIColorConverter.fromString(valueString) {
					self.properties.append(PBProperty(key: key, value: color, type: PBPropertyType.Color))
				}
				else if let font = UIFontConverter.fromString(valueString) {
					self.properties.append(PBProperty(key: key, value: font, type: PBPropertyType.Font));
				}
				else if let imagePath = UIImageConverter.fromString(valueString) {
					self.properties.append(PBProperty(key: key, value: imagePath, type: PBPropertyType.Image))
				}
				else if let textAlignment = NSTextAlignmentConverter.fromString(valueString) {
					self.properties.append(PBProperty(key: key, value: textAlignment.rawValue, type: PBPropertyType.TextAlignment))
				}
				else {
					self.properties.append(PBProperty(key: key, value: valueString, type: PBPropertyType.Other))
				}

			}
			else {
				self.properties.append(PBProperty(key: key, value: value, type: PBPropertyType.Other))
			}
			
		}
		
	}
	
	public func apply(view: UIView) {
		
		for property in self.properties {
			property.apply(view)
		}
		
		for subViewNode in self.subViewNodes {
			if view.respondsToSelector(Selector(subViewNode.key)) {
				let value = view.valueForKey(subViewNode.key)
				
				if let subView = value as? UIView {
					subViewNode.apply(subView)
				}
			}
			
		}
		
	}
	
	
	private func replaceKeys(style: Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject> {
		
		var replacedStyle = Dictionary<String, AnyObject>()
		
		for (key, value) in style {
			
			if let _ = value as? Dictionary<String, AnyObject> {
				replacedStyle[key] = value
			}
			
			var newKey = ""
			
			let keyParts = key.characters.split { $0 == "-" }.map(String.init)
			
			for (index, keypart) in keyParts.enumerate() {
				if (index == 0) {
					newKey += keypart
				}
				else {
					newKey += keypart.capitalizedString
				}
			}
			
			replacedStyle[newKey] = value
		}
		
		return replacedStyle
		
	}
	
	
}
