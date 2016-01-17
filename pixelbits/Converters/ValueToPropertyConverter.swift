//
//  ValueConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class ValueToPropertyConverter {

	static func fromAnyObject(key: String, value: AnyObject) -> PBProperty {
		
		if let valueString = value as? String {
			
			if let color = UIColorConverter.fromString(valueString) {
				return PBProperty(key: key, value: color, type: PBPropertyType.UIColor)
			}
			else if let font = UIFontConverter.fromString(valueString) {
				return PBProperty(key: key, value: font, type: PBPropertyType.UIFont)
			}
			else if let fontStyle = UIFontTextStyleConverter.fromString(valueString) {
				return PBProperty(key: key, value: fontStyle, type: PBPropertyType.UIFontTextStyle)
			}
			else if let image = UIImageConverter.fromString(valueString) {
				return PBProperty(key: key, value: image, type: PBPropertyType.UIImage)
			}
			else if let textAlignment = NSTextAlignmentConverter.fromString(valueString) {
				return PBProperty(key: key, value: textAlignment.rawValue, type: PBPropertyType.NSTextAlignment)
			}
			else if let contentHorizontalAlignment = UIControlContentHorizontalAlignmentConverter.fromString(valueString) {
				return PBProperty(key: key, value: contentHorizontalAlignment.rawValue, type: PBPropertyType.UIContentHorizontalAlignment)
			}
			else if let contentVerticalAlignment = UIControlContentVerticalAlignmentConverter.fromString(valueString) {
				return PBProperty(key: key, value: contentVerticalAlignment.rawValue, type: PBPropertyType.UIContentVerticalAlignment)
			}
			else if let contentMode = UIViewContentModeConverter.fromString(valueString) {
				return PBProperty(key: key, value: contentMode.rawValue, type: PBPropertyType.UIViewContentMode)
			}
			else if let adjustmentMode = UIViewTintAdjustmentModeConverter.fromString(valueString) {
				return PBProperty(key: key, value: adjustmentMode.rawValue, type: PBPropertyType.UIViewTintAdjustmentMode)
			}
			else if let edgeInsets = UIEdgeInsetsConverter.fromString(valueString) {
				return PBProperty(key: key, value: edgeInsets, type: PBPropertyType.UIEdgeInsets)
			}
		}

		return PBProperty(key: key, value: value, type: .Other)
		
		
	}
	
}
