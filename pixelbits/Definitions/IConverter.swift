//
//  IConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 18/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

protocol Converter {
	typealias ConversionValue
	
	static func fromString(value: String) -> ConversionValue?
}