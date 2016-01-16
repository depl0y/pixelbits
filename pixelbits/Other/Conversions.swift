//
//  Conversions.swift
//  pixelbits
//
//  Created by Wim Haanstra on 15/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

internal class Conversions: NSObject {

	static let NSTextAlignments = [
		"NSTextAlignmentLeft" : NSTextAlignment.Left,
		"NSTextAlignmentRight" : NSTextAlignment.Right,
		"NSTextAlignmentCenter" : NSTextAlignment.Center,
		"NSTextAlignmentJustified" : NSTextAlignment.Justified,
		"NSTextAlignmentNatural" : NSTextAlignment.Natural
	]
	
	static let UIControlContentHorizontalAlignments = [
		"content-horizontal-left" : UIControlContentHorizontalAlignment.Left,
		"content-horizontal-right" : UIControlContentHorizontalAlignment.Right,
		"content-horizontal-center" : UIControlContentHorizontalAlignment.Center,
		"content-horizontal-fill" : UIControlContentHorizontalAlignment.Fill
	]
	
	static let UIControlContentVerticalAlignments = [
		"content-vertical-bottom" : UIControlContentVerticalAlignment.Bottom,
		"content-vertical-fill" : UIControlContentVerticalAlignment.Fill,
		"content-vertical-center" : UIControlContentVerticalAlignment.Center,
		"content-vertical-top" : UIControlContentVerticalAlignment.Top
	]
	
	static let UIViewContentModes = [
		"UIViewContentModeScaleToFill" : UIViewContentMode.ScaleToFill,
		"UIViewContentModeScaleAspectFit" : UIViewContentMode.ScaleAspectFit,
		"UIViewContentModeScaleAspectFill" : UIViewContentMode.ScaleAspectFill,
		"UIViewContentModeRedraw" : UIViewContentMode.Redraw,
		"UIViewContentModeCenter" : UIViewContentMode.Center,
		"UIViewContentModeTop" : UIViewContentMode.Top,
		"UIViewContentModeBottom" : UIViewContentMode.Bottom,
		"UIViewContentModeLeft" : UIViewContentMode.Left,
		"UIViewContentModeRight" : UIViewContentMode.Right,
		"UIViewContentModeTopLeft" : UIViewContentMode.TopLeft,
		"UIViewContentModeTopRight" : UIViewContentMode.TopRight,
		"UIViewContentModeBottomLeft" : UIViewContentMode.BottomLeft,
		"UIViewContentModeBottomRight" : UIViewContentMode.BottomRight
	]
	
	static let UIControlStates = [
		"normal" : UIControlState.Normal,
		"highlighted" : UIControlState.Highlighted,
		"disabled" : UIControlState.Disabled,
		"selected" : UIControlState.Selected,
		"focused" : UIControlState.Focused,
		"application" : UIControlState.Application,
		"reserved" : UIControlState.Reserved
	]
	
	static let UIFontTextStyles = [
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
	
}
