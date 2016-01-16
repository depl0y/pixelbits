---
layout: converter
---

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