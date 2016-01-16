---
layout: converter
title: UIFont
---

## UIFont
Handled by: <code>UIFontConverter</code>

The UIFontConverter will try to convert a `String` value to an UIFont. You can also specify the font-size in the string value.

**Example**
{% highlight JS %}
{
	"font" : "HelveticaNeue-Light",
	"some-other-font" : "AvenirNext-Italic, 18"
}
{% endhighlight %}

<div class="alert alert-info">
The value for the font name should be the <strong>exact</strong> font name, as you can look up on <a href="http://iosfonts.com/">iosfonts.com</a>.
</div>

<div class="alert alert-warning">
It is now recommended to use "dynamic font sizing" for the fonts you use in your application. This uses the font sizes the user set up in
the settings screen.
</div>

## UIFontTextStyle
Handled by: <code>UIFontTextStyleConverter</code>

| String | UIFontTextStyle |
| ------ | -------------- |
| `UIFontTextStyleTitle1` | `UIFontTextStyleTitle1` |
| `title1` | `UIFontTextStyleTitle1` |
| `UIFontTextStyleTitle2` | `UIFontTextStyleTitle2` |
| `title2` | `UIFontTextStyleTitle2` |
| `UIFontTextStyleTitle3` | `UIFontTextStyleTitle3` |
| `title3` | `UIFontTextStyleTitle3` |
| `UIFontTextStyleHeadline` | `UIFontTextStyleHeadline` |
| `headline` | `UIFontTextStyleHeadline` |
| `UIFontTextStyleSubheadline` | `UIFontTextStyleSubheadline` |
| `subheadline` | `UIFontTextStyleSubheadline` |
| `UIFontTextStyleBody` | `UIFontTextStyleBody` |
| `body` | `UIFontTextStyleBody` |
| `UIFontTextStyleFootnote` | `UIFontTextStyleFootnote` |
| `footnote` | `UIFontTextStyleFootnote` |
| `UIFontTextStyleCaption1` | `UIFontTextStyleCaption1` |
| `caption1` | `UIFontTextStyleCaption1` |
| `UIFontTextStyleCaption2` | `UIFontTextStyleCaption2` |
| `caption2` | `UIFontTextStyleCaption2` |
| `UIFontTextStyleCallout` | `UIFontTextStyleCallout` |
| `callout` | `UIFontTextStyleCallout` |

**Example**
{% highlight JS %}
{
	"font" : "title1",
	"some-other-font" : "UIFontTextStyleHeadline"
}
{% endhighlight %}

<div class="alert alert-info">
The string is <strong>case sensitive</strong>.
</div>