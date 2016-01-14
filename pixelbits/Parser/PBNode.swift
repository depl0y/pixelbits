//
//  PBNode.swift
//  pixelbits
//
//  Created by Wim Haanstra on 10/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class PBNode: NSObject {
	
	/// Parent `PBNode` for this node, nil if found in the root of the stylesheet.
	var parent: PBNode?
	
	var key: String
	
	var nodes = Array<PBNode>()
	
	var subviews = Array<PBNode>()
	
	var properties = Array<PBProperty>()
	
	init(key: String, parent: PBNode? = nil) {
		
		self.key = key
		self.parent = parent
		
		super.init()
		
	}
	
	init(key: String, style: Dictionary<String, AnyObject>, parent: PBNode? = nil) {
		
		self.key = key
		self.parent = parent
		
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
				
				if key.hasPrefix("@") {
					let subviewKey = key.substringFromIndex(key.startIndex.advancedBy(1))
					let subViewNode = PBNode(key: subviewKey, style: childDictionary, parent: self)
					//self.subviews.append(subViewNode)
					self.addSubview(subViewNode)
				}
				else {
					let childNode = PBNode(key: key, style: childDictionary, parent: self)
					self.nodes.append(childNode)
				}
			}
			else if let valueString = value as? String {
				
				if let color = UIColorConverter.fromString(valueString) {
					self.addProperty(key, value: color, type: .Color)
				}
				else if let font = UIFontConverter.fromString(valueString) {
					self.addProperty(key, value: font, type: .Font)
				}
				else if let imagePath = UIImageConverter.fromString(valueString) {
					self.addProperty(key, value: imagePath, type: .Image)
				}
				else if let textAlignment = NSTextAlignmentConverter.fromString(valueString) {
					self.addProperty(key, value: textAlignment.rawValue, type: .TextAlignment)
				}
				else if let contentHorizontalAlignment = UIControlContentHorizontalAlignmentConverter.fromString(valueString) {
					self.addProperty(key, value: contentHorizontalAlignment.rawValue, type: .ContentHorizontalAlignment)
				}
				else {
					self.addProperty(key, value: valueString, type: .Other)
				}
				
			}
			else {
				self.addProperty(key, value: value, type: .Other)
			}
		}
		
	}
	
	/**
	Add a property to the `properties` of this node, when a property with this key already exists, it is replaced.
	
	- parameter key:   The key of the property
	- parameter value: The value for the property
	- parameter type:  The type of `PBPropertyType` that is stored
	*/
	func addProperty(key: String, value: AnyObject, type: PBPropertyType) {
		
		let prop = PBProperty(key: key, value: value, type: type)

		if self.hasProperty(prop.key) {
			self.removeProperty(prop.key)
		}
		
		self.properties.append(prop)
	}
	
	/**
	Add a `PBProperty` object to the `properties` collection. If a property with the key of the supplied property
	already exists, the property is replaced
	
	- parameter property: `PBProperty` object that is added
	*/
	func addProperty(property: PBProperty) {
		
		if self.hasProperty(property.key) {
			self.removeProperty(property.key)
		}
		
		let prop = PBProperty(key: property.key, value: property.value, type: property.type)
		prop.controlState = property.controlState
		self.properties.append(prop)
	}
	
	/**
	Looks in the `properties` collection to see if a property with this key already exists.
	
	- parameter key: The key of the property to look for
	
	- returns: `true` if a property with this key already exists, otherwise `false`
	*/
	func hasProperty(key: String) -> Bool {
		
		let props = self.properties.filter { (prop) -> Bool in
			return prop.key == key
		}
		
		return props.count > 0
	
	}
	
	/**
	Remove a property with supplied key from the `properties` collection
	
	- parameter key: The key of the property to remove
	*/
	func removeProperty(key: String) {
		let props = self.properties.filter { (prop) -> Bool in
			return prop.key == key
		}
		
		for prop in props {
			self.properties.removeObject(prop)
		}
	}
	
	func addSubview(subview: PBNode) {
		if self.hasSubview(subview.key) {
			self.removeSubview(subview.key)
		}
		
		self.subviews.append(subview)
	}
	
	func hasSubview(key: String) -> Bool {
		let results = self.subviews.filter { (subview) -> Bool in
			return subview.key == key
		}
		
		return results.count > 0
	}
	
	func removeSubview(key: String) {
		let results = self.subviews.filter { (subview) -> Bool in
			return subview.key == key
		}
		
		for subview in results {
			self.subviews.removeObject(subview)
		}
	}
	

	/**
	Apply the styling of this node to the supplied `UIView`.
	
	- parameter view: The `UIView` this styling should be applied to
	*/
	func apply(view: UIView) {
		
		for property in self.properties {
			property.apply(view)
		}
		
		for subViewNode in self.subviews {
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
			
			let newKey = DictionaryKeyConverter.fromString(key)

			replacedStyle[newKey] = value
		}
		
		return replacedStyle
		
	}
	
	func pathString() -> String {
		var result = ""
		
		if parent != nil {
			result = parent!.pathString()
		}
		
		result += "/" + key
		
		return result
	}
	
	
}
