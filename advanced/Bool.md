---
layout: converter
title: Bool
---

## Bool
Handled by: <code>BooleanConverter</code>

| String | Bool |
| ------ | -------------- |
| `true` | `true` |
| `yes` | `true` |
| `false` | `false` |
| `no` | `false` |

**Example**
{% highlight JS %}
"UIButton" : {
	"hidden" : "false"
}
{% endhighlight %}

<div class="alert alert-info">
The boolean value should be defined as string and is <strong>case sensitive</strong>.
</div>