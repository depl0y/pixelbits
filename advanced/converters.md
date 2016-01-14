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
	"background-color" : "red" // The key background-color will be converted to match the property backgroundColor
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

Take a look at the [Apple Documentation](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIColor_Class/#//apple_ref/doc/uid/TP40006892-CH3-SW18) to see 
which colors are support using this method.

**Example**
{% highlight js %}
{
	"background-color" : "red", // triggers the UIColor.redColor() method
	"text-color" : "#efefef" // converts the color from HEX to light gray
}
{% endhighlight %}

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

The `UIControlState` should be specified in the **key** of your definition and should be **lowercase**.
			
**Example**
{% highlight JS %}
{
	"title:normal" : "An awesome title"
}
{% endhighlight %}

<a name="UIFont"></a>

## UIFont
Handled by: <code>UIFontConverter</code>

The UIFontConverter will try to convert a `String` value to an UIFont. You can also specify the font-size in the string value.

The value for the font name should be the **exact** font name, as you can look up on [iosfonts.com](http://iosfonts.com/)

**Example**
{% highlight JS %}
{
	"font" : "HelveticaNeue-Light",
	"some-other-font" : "AvenirNext-Italic, 18"
}
{% endhighlight %}

Currently dynamic font sizing is not supported yet, but it is high on our to-do list.

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

Currently only images from the `mainBundle` are supported.

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

The string should be **lowercase**.

<a name="UIControlContentHorizontalAlignment"></a>

## UIControlContentHorizontalAlignment
Handled by: <code>UIControlContentHorizontalAlignmentConveter</code>

| String | UIControlContentHorizontalAlignment |
| ------ | -------------- |
| `content-horizontal-left` | `UIControlContentHorizontalAlignment.Left` |
| `content-horizontal-right` | `UIControlContentHorizontalAlignment.Right` |
| `content-horizontal-center` | `UIControlContentHorizontalAlignment.Center` |
| `content-horizontal-fill` | `UIControlContentHorizontalAlignment.Fill` |

**Example**
{% highlight JS %}
"UIButton" : {
	"contentHorizontalAlignment" : "content-horizontal-right"
}
{% endhighlight %}

The string should be **lowercase**.