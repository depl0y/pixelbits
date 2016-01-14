//
//  UIControlContentHorizontalAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 13/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

class UIControlContentHorizontalAlignmentConverter: NSObject {
	
	static func fromString(alignmentString: String) -> UIControlContentHorizontalAlignment? {
		
		let alignments = [
			"content-horizontal-left" : UIControlContentHorizontalAlignment.Left,
			"content-horizontal-right" : UIControlContentHorizontalAlignment.Right,
			"content-horizontal-center" : UIControlContentHorizontalAlignment.Center,
			"content-horizontal-fill" : UIControlContentHorizontalAlignment.Fill
		]
		
		return alignments[alignmentString]
	}

}
