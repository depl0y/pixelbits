//
//  UIControlStateConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 09/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIControlStateConverter {
	
	
	static func fromString(controlState: String) -> UIControlState {
		
		if let controlState = ConverterValues.UIControlStates[controlState.lowercaseString] {
			return controlState
		}

		return UIControlState.Normal
	}
	
}
