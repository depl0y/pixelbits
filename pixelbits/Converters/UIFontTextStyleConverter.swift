//
//  UIFontTextStyleConverter.swift
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

class UIFontTextStyleConverter {
	
	static func fromString(stringValue: String) -> UIFont? {
		
		var fontStyles = [
			"title1" : UIFontTextStyleTitle1,
			"UIFontTextStyleTitle1" : UIFontTextStyleTitle1,
			"title2" : UIFontTextStyleTitle2,
			"UIFontTextStyleTitle2" : UIFontTextStyleTitle2,
			"title3" : UIFontTextStyleTitle3,
			"UIFontTextStyleTitle3" : UIFontTextStyleTitle3,
			"headline" : UIFontTextStyleHeadline,
			"UIFontTextStyleHeadline" : UIFontTextStyleHeadline,
			"subheadline" : UIFontTextStyleSubheadline,
			"UIFontTextStyleSubheadline" : UIFontTextStyleSubheadline,
			"body" : UIFontTextStyleBody,
			"UIFontTextStyleBody" : UIFontTextStyleBody,
			"footnote" : UIFontTextStyleFootnote,
			"UIFontTextStyleFootnote" : UIFontTextStyleFootnote,
			"caption1" : UIFontTextStyleCaption1,
			"UIFontTextStyleCaption1" : UIFontTextStyleCaption1,
			"caption2" : UIFontTextStyleCaption2,
			"UIFontTextStyleCaption2" : UIFontTextStyleCaption2,
			"callout" : UIFontTextStyleCallout,
			"UIFontTextStyleCallout" : UIFontTextStyleCallout
		]

		if let style = fontStyles[stringValue] {
			return UIFont.preferredFontForTextStyle(style)
		}
		
		return nil
		
	}
	
}
