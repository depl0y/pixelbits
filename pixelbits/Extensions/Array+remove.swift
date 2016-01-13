//
//  Array+remove.swift
//  pixelbits
//
//  Created by Wim Haanstra on 13/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {

	/**
	Remove object from Array
	
	- parameter object: Object to remove from the array
	*/
	mutating func removeObject(object: Element) {
		if let index = self.indexOf(object) {
			self.removeAtIndex(index)
		}
	}
	
	/**
	Remove multiple objects from this Array
	
	- parameter objects: Objects to remove from the array
	*/
	mutating func removeObjects(objects: [Element]) {
		for object in objects {
			self.removeObject(object)
		}
	}

}
