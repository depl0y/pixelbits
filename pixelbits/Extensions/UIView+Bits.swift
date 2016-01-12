//
//  UIView+Bits.swift
//  pixelbits
//
//  Created by Wim Haanstra on 20/12/15.
//  Copyright © 2015 Wim Haanstra. All rights reserved.
//

import UIKit

public extension UIView {
	
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
	
	public var className: String? {
		set {
			objc_setAssociatedObject(
				self,
				&AssociationKeys.UIViewClassName,
				newValue,
				objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
			
			self.setNeedsDisplay()
		}
		get {
			return objc_getAssociatedObject(
				self,
				&AssociationKeys.UIViewClassName
				) as? String
		}
	}
	
	public var stylingExpression: String {
		get {
			return self.stylingRegularExpression(nil)
		}
	}
	
	public func updateStyling() {
		var path = self.stylingRegularExpression(nil)
		path = "^(\(path))$"
		
		self.setNeedsDisplay()
		
		let style = Pixelbits.sharedInstance.getStyle(path)
		style.apply(self)

		for v in self.subviews {
			v.updateStyling();
		}
	}
	
	public func setValue(value: AnyObject, forKey key: String, forState state: UIControlState) {
		
		let methodName = "set" + key + ":forState:"
		let sel = Selector(methodName)
		
		if self.respondsToSelector(sel) {
			typealias setValueForControlStateIMP = @convention(c) (UIView, Selector, AnyObject, UIControlState) -> Void
			
			Log.info("\(className!) responds to \(methodName) : \(value)")
			
			let methodSignature = self.methodForSelector(sel)
			let callback = unsafeBitCast(methodSignature, setValueForControlStateIMP.self)
			callback(self, sel, value, state)
		}
		else {
			Log.error("\(className!) DOES NOT respond to \(methodName)")
		}
	}
	
	private func stylingRegularExpression(path: String?) -> String {
		
		let mirror = Mirror(reflecting: self)
		let seperator = " > "
		
		self.className = "\(mirror.subjectType)"
		
		var stylingPath = "\(mirror.subjectType)"
		if (self.style != nil) {
			stylingPath += "(.\(self.style!))?"
			
			self.className = "\(self.className!).\(self.style!)"
		}
		
		if path != nil {
			stylingPath += seperator
			stylingPath += path!;
		}
		
		if self.superview != nil {
			stylingPath = self.superview!.stylingRegularExpression(stylingPath)
		}
		
		return stylingPath;
	}
	
	
	
}