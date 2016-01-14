---
layout: page
---

# Getting started
	
### Installation
Currently you can only include pixelbits by using cocoapods directly from this git repository, add the following to your `Podfile`.

{% highlight bash %}
platform :ios, '8.0'
use_frameworks!

pod 'pixelbits', :git => 'https://github.com/depl0y/pixelbits.git'
{% endhighlight %}

### Stylesheets
Pixelbits (in it's current state) uses JSON as 'stylesheets'. You can add some hierarchy to your JSON file to target specific UIViews. 

Let's say you have the following simple hierarchy in your app:

<div class="row">
<div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
	<img src="{{ "/images/hierarchy-1.png" | prepend: site.baseurl }}" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" />
	<br/><br/>
</div>
<div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
	1. A <code>UIViewController</code> as the base of course<br/>
	2. A <code>UIView</code>, which is inside your <code>UIViewController</code><br/>
	3. <code>MyCustomView</code> is a view, you created yourself, inheriting from <code>UIView</code>.<br/>
	4. You added a <code>UIButton</code> to your <code>MyCustomView</code>.
</div>
</div><br/>

Now you would like to give the <code>UIButton</code> a specific style, this is a piece of cake with Pixelbits. 

First things first, you need to add a JSON file to your project, in our example we are going to call it **stylesheet.json**.

To style a <code>UIButton</code>, specifically targeting this hierarchy, you can put the following code in your stylesheet file:

{% highlight JS %}
{
	"UIViewController" : {
		"UIView" : {
			"MyCustomView" : {
				"UIButton" : {
					"background-color" : "yellow"
				}
			}
		}
	}
}
{% endhighlight %}

This will target every `UIButton` that is within this hierarchy, so if you added more `UIButtons` in your `MyCustomView`, they will all have a nice yellow background color.

#### Style

This is the exact reason that Pixelbits has added a nice `style` property to **all** your `UIView` objects. 
This way you can set the `style`-property to (for example) `yellow-background`. 

Now if you update your stylesheet like this, it will only make the one with the applied style yellow.

{% highlight json %}
{
	"UIViewController" : {
		"UIView" : {
			"MyCustomView" : {
				"UIButton.yellow-background" : {
					"background-color" : "yellow"
				}
			}
		}
	}
}
{% endhighlight %}