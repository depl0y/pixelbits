---
layout: converter
title: UIImage
---

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