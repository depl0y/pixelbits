//
//  PBPropertyType.swift
//  pixelbits
//
//  Created by Wim Haanstra on 12/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal enum PBPropertyType: Int {
	case UIColor = 0
	case Number
	case Boolean
	case UIImage
	case UIFont
	case NSTextAlignment
	case UIContentHorizontalAlignment
	case UIContentVerticalAlignment
	case UIFontTextStyle
	case UIViewContentMode
	case UIViewTintAdjustmentMode
	case UIEdgeInsets
	case CGRect
	case Other
}