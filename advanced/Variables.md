---
layout: page
title: Variables
---

# Variables

In your stylesheet, you can define variables to easily adjust your stylesheet with only a couple of changes. Currently variables can **only** be defined at the root of your stylesheet.

Variables are ALWAYS prefixed with a dollar (**$**) sign.

Here's an example:

{% highlight js %}
{
    "$button-background-color" : "red",
    "MyCustomView" : {
        "UIButton" : {
            "background-color" : "$button-background-color"
        }
    }
}
{% endhighlight %} 


