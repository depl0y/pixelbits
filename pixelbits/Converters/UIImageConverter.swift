//
//  UIImageConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 11/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class UIImageConverter {

	static func fromString(imageString: String) -> UIImage? {
		
		let expression = "image\\((.+?)\\)"
		
		let imageMatches = imageString.variableValue().matches(expression)
		
		if imageMatches.count == 0 {
			return nil
		}
		
		let imageName = imageMatches[0]
		var img = UIImage(named: imageName)
		
		if img == nil {
			img = UIImage()
		}
		
		return img
	}
	
	
}
