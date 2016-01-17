---
layout: converter
title: UIEdgeInsets
---

## UIEdgeInsets
Handled by: <code>UIEdgeInsetsConverter</code>

You can specify `UIEdgeInsets` in your stylesheet in a couple of ways. It is comparable as the `padding` attribute in CSS.

`insets(5)`  
This is translated to `UIEdgeInsets(5, 5, 5, 5)`

`insets(5, 10)`  
This is translated to `UIEdgeInsets(5, 10, 5, 10)`

`insets(1, 2, 3, 4)`  
This is translated to `UIEdgeInsets(1, 2, 3, 4)`

**Example**
{% highlight js %}
{
	"layout-margins" : "insets(5, 10)"
}
{% endhighlight %}