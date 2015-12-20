//
//  UIView+Bits.swift
//  pixelbits
//
//  Created by Wim Haanstra on 20/12/15.
//  Copyright © 2015 Wim Haanstra. All rights reserved.
//

import UIKit

extension UIView {

	var style: String? {
		set {
			objc_setAssociatedObject(
				self,
				&AssociationKeys.UIViewStyle,
				newValue,
				objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
		}
		get {
			return objc_getAssociatedObject(
				self,
				&AssociationKeys.UIViewStyle
			) as? String
		}
	}
	
}
