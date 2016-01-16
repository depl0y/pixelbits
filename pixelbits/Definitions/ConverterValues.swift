//
//  Conversions.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

internal class ConverterValues: NSObject {

	static let NSTextAlignments = [
		"left"						: NSTextAlignment.Left,
		"NSTextAlignmentLeft"		: NSTextAlignment.Left,
		"right"						: NSTextAlignment.Right,
		"NSTextAlignmentRight"		: NSTextAlignment.Right,
		"center"					: NSTextAlignment.Center,
		"NSTextAlignmentCenter"		: NSTextAlignment.Center,
		"justified"					: NSTextAlignment.Justified,
		"NSTextAlignmentJustified"	: NSTextAlignment.Justified,
		"natural"					: NSTextAlignment.Natural,
		"NSTextAlignmentNatural"	: NSTextAlignment.Natural
	]
	
	static let UIControlContentHorizontalAlignments = [
		"content-left"								: UIControlContentHorizontalAlignment.Left,
		"UIControlContentHorizontalAlignmentLeft"	: UIControlContentHorizontalAlignment.Left,
		"content-right"								: UIControlContentHorizontalAlignment.Right,
		"UIControlContentHorizontalAlignmentRight"	: UIControlContentHorizontalAlignment.Right,
		"content-center"							: UIControlContentHorizontalAlignment.Center,
		"UIControlContentHorizontalAlignmentCenter" : UIControlContentHorizontalAlignment.Center,
		"content-fill"								: UIControlContentHorizontalAlignment.Fill,
		"UIControlContentHorizontalAlignmentFill"	: UIControlContentHorizontalAlignment.Fill
	]
	
	static let UIControlContentVerticalAlignments = [
		"content-bottom"							: UIControlContentVerticalAlignment.Bottom,
		"UIControlContentVerticalAlignmentBottom"	: UIControlContentVerticalAlignment.Bottom,
		"content-vfill"								: UIControlContentVerticalAlignment.Fill,
		"UIControlContentVerticalAlignmentFill"		: UIControlContentVerticalAlignment.Fill,
		"content-vcenter"							: UIControlContentVerticalAlignment.Center,
		"UIControlContentVerticalAlignmentCenter"	: UIControlContentVerticalAlignment.Center,
		"content-top"								: UIControlContentVerticalAlignment.Top,
		"UIControlContentVerticalAlignmentTop"		: UIControlContentVerticalAlignment.Top
	]
	
	static let UIViewContentModes = [
		"UIViewContentModeScaleToFill"		: UIViewContentMode.ScaleToFill,
		"UIViewContentModeScaleAspectFit"	: UIViewContentMode.ScaleAspectFit,
		"UIViewContentModeScaleAspectFill"	: UIViewContentMode.ScaleAspectFill,
		"UIViewContentModeRedraw"			: UIViewContentMode.Redraw,
		"UIViewContentModeCenter"			: UIViewContentMode.Center,
		"UIViewContentModeTop"				: UIViewContentMode.Top,
		"UIViewContentModeBottom"			: UIViewContentMode.Bottom,
		"UIViewContentModeLeft"				: UIViewContentMode.Left,
		"UIViewContentModeRight"			: UIViewContentMode.Right,
		"UIViewContentModeTopLeft"			: UIViewContentMode.TopLeft,
		"UIViewContentModeTopRight"			: UIViewContentMode.TopRight,
		"UIViewContentModeBottomLeft"		: UIViewContentMode.BottomLeft,
		"UIViewContentModeBottomRight"		: UIViewContentMode.BottomRight
	]
	
	static let UIControlStates = [
		"normal"			: UIControlState.Normal,
		"highlighted"		: UIControlState.Highlighted,
		"disabled"			: UIControlState.Disabled,
		"selected"			: UIControlState.Selected,
		"focused"			: UIControlState.Focused,
		"application"		: UIControlState.Application,
		"reserved"			: UIControlState.Reserved
	]
	
	static let UIFontTextStyles = [
		"title1"						: UIFontTextStyleTitle1,
		"UIFontTextStyleTitle1"			: UIFontTextStyleTitle1,
		"title2"						: UIFontTextStyleTitle2,
		"UIFontTextStyleTitle2"			: UIFontTextStyleTitle2,
		"title3"						: UIFontTextStyleTitle3,
		"UIFontTextStyleTitle3"			: UIFontTextStyleTitle3,
		"headline"						: UIFontTextStyleHeadline,
		"UIFontTextStyleHeadline"		: UIFontTextStyleHeadline,
		"subheadline"					: UIFontTextStyleSubheadline,
		"UIFontTextStyleSubheadline"	: UIFontTextStyleSubheadline,
		"body"							: UIFontTextStyleBody,
		"UIFontTextStyleBody"			: UIFontTextStyleBody,
		"footnote"						: UIFontTextStyleFootnote,
		"UIFontTextStyleFootnote"		: UIFontTextStyleFootnote,
		"caption1"						: UIFontTextStyleCaption1,
		"UIFontTextStyleCaption1"		: UIFontTextStyleCaption1,
		"caption2"						: UIFontTextStyleCaption2,
		"UIFontTextStyleCaption2"		: UIFontTextStyleCaption2,
		"callout"						: UIFontTextStyleCallout,
		"UIFontTextStyleCallout"		: UIFontTextStyleCallout
	]
	
}
