//
//  DictionaryKeyConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

import UIKit

internal class DictionaryKeyConverter {

	static func fromString(key: String) -> String {
		
		var newKey = ""
		
		let keyParts = key.characters.split { $0 == "-" }.map(String.init)
		
		for (index, keypart) in keyParts.enumerate() {
			if (index == 0) {
				newKey += keypart
			}
			else {
				newKey += keypart.capitalizedString
			}
		}
		
		return newKey

	}
}
