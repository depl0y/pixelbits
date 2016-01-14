---
layout: page
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
	1. <code>MyViewController</code> (inherits of `UIViewController`) as the base of course<br/>
	2. A <code>UIView</code>, which is part of your <code>UIViewController</code><br/>
	3. <code>MyCustomView</code> is a view, you created yourself, inheriting from <code>UIView</code>.<br/>
	4. You added a <code>UIButton</code> to your <code>MyCustomView</code>.
</div>
</div><br/>

If you want to style the `UIButton` in this hierarchy, it is very important you understand how Pixelbits handles this:

First Pixelbits will figure out the path to this UIButton, which is: `/MyViewController/UIView/MyCustomView/UIButton`. Pixelbits will generate this
path based on the **types** of the objects found. 

Now, targeting the `UIButton` is fairly easy if you understand the concept.

{% highlight js %}
{
	"MyViewController" : {
		"UIView" : {
			"background-color" : "#dedede",

			"MyCustomView" : {
				"background-color" : "blue",
				
				"UIButton" : {
					"Title:normal" : "My button",
					"TitleColor:normal" : "white",
					"background-color" : "red"
				}
			}
		}
	}
}
{% endhighlight %}

You can also target **every** `UIButton` within a `MyCustomView`. Just move the `MyCustomView` key outside the `MyViewController` and it will be applied to every `UIButton`
which is a subview of a `MyCustomView`.

{% highlight js %}
{
	"MyViewController" : {
		"UIView" : {
			"background-color" : "#dedede",
		}
	},
	
	"MyCustomView" : {
		"background-color" : "blue",
		
		"UIButton" : {
			"Title:normal" : "My button",
			"TitleColor:normal" : "white",
			"background-color" : "red"
		}
	}
}
{% endhighlight %}