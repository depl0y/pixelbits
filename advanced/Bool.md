---
layout: converter
title: Bool
---

## Bool
Handled by: <code>BooleanConverter</code>

| String | Bool |
| ------ | -------------- |
| `"true"` | `true` |
| `"yes"` | `true` |
| `true` | `true` |
| `"false"` | `false` |
| `"no"` | `false` |
| `false` | `false` |

**Example**
{% highlight JS %}
"UIButton" : {
	"hidden" : "false",
	"userInteractionEnabled" : true
}
{% endhighlight %}

<div class="alert alert-info">
The <code>Bool</code> value can be specified as string or as direct value, the string is <strong>case sensitive</strong>.
</div>