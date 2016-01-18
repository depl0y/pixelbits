---
layout: converter
title: CGRect
---

## CGRect
Handled by: <code>CGRectConverter</code>

You can specify `CGRect` in your stylesheet in a couple of ways. It is comparable as the `padding` attribute in CSS.

| String | Translated to CGRect |
| ------ | ------------ |
| `rect(5)` | `CGRect(5, 5, 5, 5)` |
| `rect(5, 10)` | `CGRect(5, 10, 5, 10)` |
| `rect(1, 2, 3, 4)` | `CGRect(1, 2, 3, 4)` |

**Example**
{% highlight js %}
{
	"frame" : "rect(20, 20, 150, 44)"
}
{% endhighlight %}