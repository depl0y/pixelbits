# Pixelbits

Pixelbits is a swift based library that reads a YAML (or multiple) file and applies styles to the `UIView` objects you create in your iOS application.

## Format
The format for pixelbits has not been decided yet.
## Currently supported
* Fonts
* Fonts with a specific size
* UIColor
* UIControlState
* UIImage
* NSTextAlignment
* Subviews

## How to install

Currently you can only include pixelbits by using cocoapods directly from this git repository:

`pod 'pixelbits', :git => 'https://github.com/depl0y/pixelbits.git'`


## Usage

**DON'T HAVE THIS FINALIZED, NOT SURE HOW THIS IS GOING TO WORK YET 😃**

Initialize pixelbits with a single or multiple stylesheets:

```
Pixelbits.addStylesheet("stylesheet.json")
```

## Style tag

With Pixelbits you can apply styles to a view in a couple of ways. For example, if you have a `UIViewController` containing a `UILabel`, you can style this UILabel like this:

```
"UIViewController" : {
	"UILabel" : {
		background-color: "white"
	}
}
```

**But** this will style every UILabel which you added directly to the UIView of the UIViewController. Maybe not what you want.

You can also fill the style property on your UILabel and then you can specifically target it like this:


```
"UIViewController" : {
	"UILabel.my-style-value" : {
		background-color: "white"
	}
}
```

## Rule priority

For example, this is my UIView hierarchy: 

```
- UIView
	|  
	--> UIView.some-style
			|  
			--> UIButton.login-button
```

**More** specific rules overwrite less specific rules your stylesheet.

In this example (looking at the `UIButton` with the style tag `login-button`, the following definitions will be searched for and applied (in this order, **I think**):

1. UIButton
2. UIView > UIButton
3. UIView > UIView > UIButton
4. UIView.some-style > UIButton
5. UIButton.login-button
6. UIView > UIButton.login-button
7. UIView.some-style > UIButton.login-button
8. UIView > UIView.some-style > UIButton.login-button

## Property matching
Pixelbits tries to help you a **little** in making your stylesheets a bit more readable.

Imagine you have a UIView which you would like to give a background color.

There are 2 ways you can define this *currently*:

`"backgroundColor" : "gray"` **or** 
`"background-color" : "gray"`

`backgroundColor` is the exact name of the property on an `UIView`, using the exact name is recommended, but for readability you could use the `background-color` notation. Pixelbits will always remove **dashes** and uppercase the first character after the dash. So **internally** `background-color` will translate to `backgroundColor`.

## Subviews
When you want to style subviews of a UIView, which you haven't added to your hierarchy (for example the `titleLabel` of a `UIButton`), you can do this by defining it as a ne, prefixed with a `@`. Example:

```
	"background-color": "white",
	"font" : "HelveticaNeue-Light, 18",
	"text-color" : "black",
	"Title:normal" : "Pixelbits rules",
	"textAlignment" : "center",
	"@titleLabel" : [
		"text-color" : "black"
	]
```

## UIControlState

You can also include a state in your stylesheet. Currently you do this by including the state in the key. For example:

`"title:normal" : "My perfect title here"`

**Internally** this will perform the `setTitle:forState` method on the affected UIView.

Here is a list of the states and their string versions:

```
"normal" : UIControlState.Normal,
"highlighted" : UIControlState.Highlighted,
"disabled" : UIControlState.Disabled,
"selected" : UIControlState.Selected,
"focused" : UIControlState.Focused,
"application" : UIControlState.Application,
"reserved" : UIControlState.Reserved
```  

The match is case **insensitive**.

## UIColor

You can define colors in 2 ways, using hexadecimal colors (usually used for the web), or use the named methods of the UIColor object.

For example:

```
"background-color" : "#dedede"
"text-color" : "gray"
```

The `background-color`  will internally be translated from `#dedede` to a gray color. The `text-color` will be converted to an UIColor by calling the `UIColor.grayColor()` method.

## NSTextAlignment

```
"left" : NSTextAlignment.Left,
"right" : NSTextAlignment.Right,
"center" : NSTextAlignment.Center,
"justified" : NSTextAlignment.Justified,
"natural" : NSTextAlignment.Natural
```

## UIImage
Currently you can only 'load' images into properties from the main bundle. If you define an image in your stylesheet, you should include it like this:

```
"UIButton.login-button" : {
	"BackgroundImage:normal" : "image(someimage.jpg)"
}
```

## So now what?

Nothing yet, first I want some basic functionality working, after that I will do performance optimizations.
