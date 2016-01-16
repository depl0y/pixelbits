---
layout: converter
title: UIControlState
---

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