---
layout: page
title: Selectors
---

# Selectors

Pixelbits supports CSS like selectors. You can target views through a really specific path or parts of the part.

Let's use our example image again:

<div class="row">
<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
	<img src="{{ "/images/Hierarchy-example.jpg" | prepend: site.baseurl }}" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" />
	<br/><br/>
</div>
<div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
	1. <code>MyViewController</code> (inherits of <code>UIViewController</code>) as the base of course<br/>
	2. A <code>UIView</code>, which is part of your <code>UIViewController</code><br/>
	3. <code>MyCustomView</code> is a view, you created yourself, inheriting from <code>UIView</code>.<br/>
	4. You added a <code>UIButton</code> to your <code>MyCustomView</code>.
</div>
</div><br/>

You desperately want the UIButton to be styled. To do this, you have a couple of options, we will be going from less-specific to really specific.

### Based on class

To style every `UIButton` you have, just add a simple rule to your stylesheet.

{% highlight js %}
"UIButton" : {
	"background-color" : "red"
}
{% endhighlight %} 

### Based on class and parents

Of course, you don't want every `UIButton` to have the same look. Maybe you want that `UIButton` that is located within `MyCustomView`
to have a different background color.

{% highlight js %}
"MyCustomView" : {
	"UIButton" : {
		"background-color" : "red"
	}
}
{% endhighlight %} 

### Based on class and style

Pixelbits adds a new property to every view which inherits from `UIView`. The property is called `style` and it can be used to identify
a single **or** multiple views and style them accordingly.

**Add a style to your `UIButton`**
{% highlight c %}
let btn = UIButton(type: UIButtonType.Custom)
btn.style = "red-background"
{% endhighlight %}

**Target this style**  
Now the background color will be applied to every `UIView` that has the style `red-background` assigned.

{% highlight js %}
".red-background" : {
	"background-color" : "red"
}
{% endhighlight %} 

**Target a class with a style**  
Now the background color will be applied to every `UIButton` that has the style `red-background` assigned.
{% highlight js %}
"UIButton.red-background" : {
	"background-color" : "red"
}
{% endhighlight %} 

### Based on class, style and parents

This is the most specific way to target your views. You look at the hierarchy you are using within your app and make sure you stick to that in your
stylesheet.

So in our `UIButton` case, if we were to give this UIButton a red background, we would do it like this.

**Add a style to your `UIButton`**
{% highlight c %}
let btn = UIButton(type: UIButtonType.Custom)
btn.style = "my-unique-style"
{% endhighlight %}

**Add this style, with its exact location to your stylesheet**	 
{% highlight js %}
"MyViewController" : {
	"UIView" : {
		"MyCustomView" : {
			"UIButton.my-unique-style" : {
				"background-color" : "red"
			}
		}
	}
}
{% endhighlight %}

### Mix it up!

But that's not all. You can also mix styles up and based on rule priority Pixelbits will create the style for your button.

{% highlight js %}
"MyViewController" : {
	"UIView" : {
		"MyCustomView" : {
			"UIButton" : {
				"background-color" : "red"
			}
		}
	}
},
"UIButton" : {
	"TitleColor:normal" : "white"
}
{% endhighlight %}

This example will give **every** `UIButton` in your app a `white` title color, but only a really specific one a `red` background.