---
layout: converter
title: UIEdgeInsets
---

## UIEdgeInsets
Handled by: <code>UIEdgeInsetsConverter</code>

You can specify `UIEdgeInsets` in your stylesheet in a couple of ways. It is comparable as the `padding` attribute in CSS.

| String | Translated to UIEdgeInsets |
| ------ | ------------ |
| `insets(5)` | `UIEdgeInsets(5, 5, 5, 5)` |
| `insets(5, 10)` | `UIEdgeInsets(5, 10, 5, 10)` |
| `insets(1, 2, 3, 4)` | `UIEdgeInsets(1, 2, 3, 4)` |

**Example**
{% highlight js %}
{
	"layout-margins" : "insets(5, 10)"
}
{% endhighlight %}