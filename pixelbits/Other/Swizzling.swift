//
//  Swizzling.swift
//  pixelbits
//
//  Created by Wim Haanstra on 19/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

internal class Swizzling {

	internal static func setup() {
		Swizzling.swizzle(UIView.self, originalSelector: Selector("setNeedsDisplay"), swizzledClass: UIView.self, swizzledSelector: "pixelbitsSetNeedsDisplay")
	}
	
	private static func swizzle(originalClass: AnyClass!, originalSelector: Selector, swizzledClass: AnyClass!, swizzledSelector: Selector) {
		
		let method: Method = class_getInstanceMethod(originalClass, originalSelector)
		let swizzledMethod: Method = class_getInstanceMethod(swizzledClass, swizzledSelector)

		if method != nil && swizzledMethod != nil {
			Log.debug("SWIZZLE: \(originalClass).\(originalSelector) => \(swizzledClass).\(swizzledSelector)")
			method_exchangeImplementations(method, swizzledMethod)
		}
		
	}
	
}
