//
//  UIViewTintAdjustmentModeConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 17/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIViewTintAdjustmentModeConverter {

	static func fromString(stringValue: String) -> UIViewTintAdjustmentMode? {
		return ConverterValues.UIViewTintAdjustmentModes[stringValue]
	}
	
}
