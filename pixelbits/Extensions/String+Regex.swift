//
//  String+Regex.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

extension String {
	
	func matches(pattern: String) -> [String] {
		
		do {
			let regex = try NSRegularExpression(pattern: pattern, options: [])
			let nsstring = self as NSString
			
			let results = regex.matchesInString(self, options: [], range: NSMakeRange(0, nsstring.length))
			
			return results.map { nsstring.substringWithRange($0.rangeAtIndex(1)) }
		}
		catch let error as NSError {
			
			Log.error("\(error) occured")
			
			return []
		}
		
	}
	
}
