//
//  UIControlContentVerticalAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

class UIControlContentVerticalAlignmentConverter {

	static func fromString(alignmentString: String) -> UIControlContentVerticalAlignment? {

		let alignments = [
			"content-vertical-bottom" : UIControlContentVerticalAlignment.Bottom,
			"content-vertical-fill" : UIControlContentVerticalAlignment.Fill,
			"content-vertical-center" : UIControlContentVerticalAlignment.Center,
			"content-vertical-top" : UIControlContentVerticalAlignment.Top
		]
		
		return alignments[alignmentString]
	}
	
}
