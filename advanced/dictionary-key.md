---
layout: converter
---

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