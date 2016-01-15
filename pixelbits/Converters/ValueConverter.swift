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
			else if let image = UIImageConverter.fromString(valueString) {
				return PBProperty(key: key, value: image, type: PBPropertyType.UIImage)
			}
			else if let fontStyle = UIFontTextStyleConverter.fromString(valueString) {
				return PBProperty(key: key, value: fontStyle, type: PBPropertyType.UIFontTextStyle)
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
		}

		return PBProperty(key: key, value: value, type: .Other)
		
		
	}
	
}
