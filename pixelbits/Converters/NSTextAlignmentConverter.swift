//
//  NSTextAlignmentConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

public class NSTextAlignmentConverter: NSObject {
	
	
	public static func fromString(alignmentString: String) -> NSTextAlignment? {
		
		var alignments = [
			"left" : NSTextAlignment.Left,
			"right" : NSTextAlignment.Right,
			"center" : NSTextAlignment.Center,
			"justified" : NSTextAlignment.Justified,
			"natural" : NSTextAlignment.Natural
		]
		
		return alignments[alignmentString.lowercaseString]		
	}

}
