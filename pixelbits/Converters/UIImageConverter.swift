//
//  UIImageConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

public class UIImageConverter: NSObject {

	public static func fromString(imageString: String) -> String? {
		
		if !imageString.hasPrefix("image(") || !imageString.hasSuffix(")") {
			return nil
		}
		
		let resourcePath = NSBundle.mainBundle().pathForResource("fnf.jpg", ofType: nil)
		
		return resourcePath
	}
	
	
}
