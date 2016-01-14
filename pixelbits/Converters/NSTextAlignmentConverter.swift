//
//  NSTextAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

class NSTextAlignmentConverter {
	
	static func fromString(alignmentString: String) -> NSTextAlignment? {
		
		let alignments = [
			"left" : NSTextAlignment.Left,
			"right" : NSTextAlignment.Right,
			"center" : NSTextAlignment.Center,
			"justified" : NSTextAlignment.Justified,
			"natural" : NSTextAlignment.Natural
		]
		
		return alignments[alignmentString]		
	}

}
