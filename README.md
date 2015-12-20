# Pixelbits

Pixelbits is a swift based library that reads a YAML (or multiple) file and applies styles to the `UIView` objects you create in your iOS application.

## YAML, not CSS?
The choice for YAML was not easy, but because I try to stay as close as I can to the syntax of iOS, there was no need for CSS. That only gives you a fake feeling of confidence, that you know what you are doing.

## Currently supported
* Nothing yet, setting up the project for now

## Planned
* Let's first get a simple UILabel and a custom class working, then we'll see what we can do.

## How to install

Currently you can only include pixelbits by using cocoapods directly from this git repository:

`pod 'pixelbits', :git => 'https://github.com/depl0y/pixelbits.git'`


## Usage

Initialize pixelbits with a single or multiple stylesheets:

```
Pixelbits.addStylesheet("my_style.yaml")
```

You can also specify a style on an individual `UIView` object:

```
var myView = UIView()
myView.style = "some-style"
```

Now you can identify this view in your style sheet:

```
UIView.some-style
   background-color: white
```

## So now what?
Nothing yet, working on it, but want to get the repository up and also test integration while working on it.