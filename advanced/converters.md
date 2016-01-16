---
layout: page
---

# Converters

Pixelbits relies heavily on it's so-called 'Converters', these translate the values you
put in your stylesheets to values Swift actually understands.

Currently these are the converters that are supported, but the list could be infinitly long, so we still will probably never have everything covered.

1. [Dictionary Keys](#DictionaryKey)
2. [UIColor](#UIColor)
3. [UIControlState](#UIControlState)
4. [UIFont](#UIFont)
5. [UIImage](#UIImage)
6. [NSTextAlignment](#NSTextAlignment)
7. [UIControlContentHorizontalAlignment](#UIControlContentHorizontalAlignment)
8. [UIControlContentVerticalAlignment](#UIControlContentVerticalAlignment)


<a name="DictionaryKey"></a>

## Dictionary Key
Handled by: <code>DictionaryKeyConverter</code>

This converts the keys in your stylesheet to the property names on an `UIView`. I **recommend** using the EXACT name of the property in your stylesheet, but you can deviate from 
that a bit, for readability.

It uses a very simple conversion:

`background-color` will be translated to `backgroundColor`. The dash will be removed from your property name and the next character after that will be converted to uppercase.

**Example**
{% highlight JS %}
{
	// The key background-color will be converted to match the property backgroundColor
	"background-color" : "red" 
}
{% endhighlight %}

<a name="UIColor"></a>

## UIColor
Handled by: <code>UIColorConverter</code>

You have 2 methods of defining colors in your stylesheet, you can either use the web-based hexadecimal way of describing them, or you can use the named colors Swift already understands.

The hexadecimal way **requires** you to prefix your color with the `#`, so it can recognize you are using a color. e.g. `#ff0000` will produce a bright red color. 
The hexadecimal way supports RGB (12 bits), RGB (24 bits) and ARGB (32 bits).

Using named colors is a bit different, so if specify a named color, you need to make sure it is an exact match to the method on the `UIColor` class. For example, if you want to use
the red color that `UIColor.redColor()` gives you, you need to put `red` as the value for your color in your stylesheet.

**Example**
{% highlight js %}
{
	"background-color" : "red", // triggers the UIColor.redColor() method
	"text-color" : "#efefef" // converts the color from HEX to light gray
}
{% endhighlight %}

<div class="alert alert-info">
Take a look at the <a href="https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIColor_Class/#//apple_ref/doc/uid/TP40006892-CH3-SW18">Apple Documentation</a> to see 
which colors are support using this method.
</div>



<a name="UIControlState"></a>

## UIControlState
Handled by: <code>UIControlStateConverter</code>

A conversion from a `String` value to `UIControlState`, according to the following table:

| String | UIControlState |
| ------ | -------------- |
| `normal` | `UIControlState.Normal` |
| `highlighted` | `UIControlState.Highlighted` |
| `disabled` | `UIControlState.Disabled` |
| `selected` | `UIControlState.Selected` |
| `focused` | `UIControlState.Focused` |
| `application` | `UIControlState.Application` |
| `reserved` | `UIControlState.Reserved` |

**Example**
{% highlight JS %}
{
	"title:normal" : "An awesome title"
}
{% endhighlight %}

<div class="alert alert-info">
The `UIControlState` should be specified in the <code>key</code> of your definition and should be <strong>lowercase</strong>.
</div>
			
<a name="UIFont"></a>

## UIFont
Handled by: <code>UIFontConverter</code>

The UIFontConverter will try to convert a `String` value to an UIFont. You can also specify the font-size in the string value.

**Example**
{% highlight JS %}
{
	"font" : "HelveticaNeue-Light",
	"some-other-font" : "AvenirNext-Italic, 18"
}
{% endhighlight %}

<div class="alert alert-info">
The value for the font name should be the <strong>exact</strong> font name, as you can look up on <a href="http://iosfonts.com/">iosfonts.com</a>.
</div>

<div class="alert alert-warning">
It is now recommended to use "dynamic font sizing" for the fonts you use in your application. This uses the font sizes the user set up in
the settings screen.
</div>

### Dynamic font sizing

| String | UIFontTextStyle |
| ------ | -------------- |
| `UIFontTextStyleTitle1` | `UIFontTextStyleTitle1` |
| `title1` | `UIFontTextStyleTitle1` |
| `UIFontTextStyleTitle2` | `UIFontTextStyleTitle2` |
| `title2` | `UIFontTextStyleTitle2` |
| `UIFontTextStyleTitle3` | `UIFontTextStyleTitle3` |
| `title3` | `UIFontTextStyleTitle3` |
| `UIFontTextStyleHeadline` | `UIFontTextStyleHeadline` |
| `headline` | `UIFontTextStyleHeadline` |
| `UIFontTextStyleSubheadline` | `UIFontTextStyleSubheadline` |
| `subheadline` | `UIFontTextStyleSubheadline` |
| `UIFontTextStyleBody` | `UIFontTextStyleBody` |
| `body` | `UIFontTextStyleBody` |
| `UIFontTextStyleFootnote` | `UIFontTextStyleFootnote` |
| `footnote` | `UIFontTextStyleFootnote` |
| `UIFontTextStyleCaption1` | `UIFontTextStyleCaption1` |
| `caption1` | `UIFontTextStyleCaption1` |
| `UIFontTextStyleCaption2` | `UIFontTextStyleCaption2` |
| `caption2` | `UIFontTextStyleCaption2` |
| `UIFontTextStyleCallout` | `UIFontTextStyleCallout` |
| `callout` | `UIFontTextStyleCallout` |

**Example**
{% highlight JS %}
{
	"font" : "title1",
	"some-other-font" : "UIFontTextStyleHeadline"
}
{% endhighlight %}

<a name="UIImage"></a>

## UIImage
Handled by: <code>UIImageConverter</code>

For loading `UIImage` objects we use an approach a bit more like CSS. You need to put the name of the image between `image(` and `)`.

**Example**
{% highlight JS %}
{
	"background-image" : "image(my-image-name.jpg)"
}
{% endhighlight %}

<div class="alert alert-danger">
Currently only images from the <code>mainBundle</code> are supported.
</div>

<a name="NSTextAlignment"></a>

## NSTextAlignment
Handled by: <code>NSTextAlignment</code>

| String | NSTextAlignment |
| ------ | -------------- |
| `left` | `NSTextAlignment.Left` |
| `right` | `NSTextAlignment.Right` |
| `center` | `NSTextAlignment.Center` |
| `justified` | `NSTextAlignment.Justified` |
| `natural` | `NSTextAlignment.Natural` |

**Example**
{% highlight JS %}
{
	"text-alignment" : "left"
}
{% endhighlight %}

<div class="alert alert-info">
The string should be <strong>lowercase</strong>.
</div>

<a name="UIControlContentHorizontalAlignment"></a>

## UIControlContentHorizontalAlignment
Handled by: <code>UIControlContentHorizontalAlignmentConverter</code>

| String | UIControlContentHorizontalAlignment |
| ------ | -------------- |
| `content-left` | `UIControlContentHorizontalAlignment.Left` |
| `content-right` | `UIControlContentHorizontalAlignment.Right` |
| `content-center` | `UIControlContentHorizontalAlignment.Center` |
| `content-fill` | `UIControlContentHorizontalAlignment.Fill` |

**Example**
{% highlight JS %}
"UIButton" : {
	"contentHorizontalAlignment" : "content-horizontal-right"
}
{% endhighlight %}

<div class="alert alert-info">
The string should be <strong>lowercase</strong>.
</div>

<a name="UIControlContentVerticalAlignment"></a>

## UIControlContentVerticalAlignment
Handled by: <code>UIControlContentVerticalAlignmentConverter</code>

| String | UIControlContentVerticalAlignment |
| ------ | -------------- |
| `content-top` | `UIControlContentVerticalAlignment.Top` |
| `content-bottom` | `UIControlContentVerticalAlignment.Bottom` |
| `content-vcenter` | `UIControlContentVerticalAlignment.Center` |
| `content-vfill` | `UIControlContentVerticalAlignment.Fill` |

**Example**
{% highlight JS %}
"UIButton" : {
	"contentVerticalAlignment" : "content-vertical-bottom"
}
{% endhighlight %}

<div class="alert alert-info">
The string should be <strong>lowercase</strong>.
</div>