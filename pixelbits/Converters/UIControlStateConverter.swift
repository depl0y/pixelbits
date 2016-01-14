//
//  UIControlStateConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 09/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

class UIControlStateConverter {
	
	
	static func fromString(controlState: String) -> UIControlState {
		
		var states = [
			"normal" : UIControlState.Normal,
			"highlighted" : UIControlState.Highlighted,
			"disabled" : UIControlState.Disabled,
			"selected" : UIControlState.Selected,
			"focused" : UIControlState.Focused,
			"application" : UIControlState.Application,
			"reserved" : UIControlState.Reserved
		]

		if states[controlState.lowercaseString] == nil {
			return UIControlState.Normal
		}
		else {
			return states[controlState.lowercaseString]!
		}
		
	}
	
}
