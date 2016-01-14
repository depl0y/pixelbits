//
//  UIView+Bits.swift
//  pixelbits
//
//  Created by Wim Haanstra on 20/12/15.
//  Copyright © 2015 Wim Haanstra. All rights reserved.
//

import UIKit

public extension UIView {
	
	/// A property that can be used to specifically target this `UIView` for styling
	public var style: String? {
		set {
			objc_setAssociatedObject(
				self,
				&AssociationKeys.UIViewStyle,
				newValue,
				objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
			
			self.setNeedsDisplay()
		}
		get {
			return objc_getAssociatedObject(
				self,
				&AssociationKeys.UIViewStyle
				) as? String
		}
	}
	
	public var viewController: UIViewController? {
		get {
			if let viewController = self.nextResponder() as? UIViewController {
				return viewController
			}
			else {
				return nil
			}
		}
	}
	
	/**
	Update styling for this `UIView` and it's subviews
	*/
	public func updateStyling() {
		
		Pixelbits.sharedInstance.applyStyle(self)
		
		for subview in self.subviews {
			subview.updateStyling()
		}
		
	}
	
	/**
	Set a value by calling the `set<key>:forState:` selector.
	This is included to support the `UIControlState`.
	
	- parameter value: The value to be set
	- parameter key:   The key of the value to be set, eg. `Title` to perform `setTitle:forState`
	- parameter state: The `UIControlState` to set this value for
	*/
	public func setValue(value: AnyObject, forKey key: String, forState state: UIControlState) {
		
		let methodName = "set" + key + ":forState:"
		let sel = Selector(methodName)
		
		typealias setValueForControlStateIMP = @convention(c) (UIView, Selector, AnyObject, UIControlState) -> Void
		
		let methodSignature = self.methodForSelector(sel)
		let callback = unsafeBitCast(methodSignature, setValueForControlStateIMP.self)
		callback(self, sel, value, state)
	}
	
}