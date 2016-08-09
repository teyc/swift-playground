# swift-playground
Exploratory GUI programming with Swift playground.

This repository holds a collection of code-only examples 
showing how
one can construct UI in Cocoa without using interface
builder. It's inspired by a series of posts by Joe Armstrong
[Fun with Swift][1]

I tried using a plain old text editor, as Joe did, but
I prefer the comfort of code completion, especially when
exploring an unfamiliar territory. In addition, I also used 
[Dash][2] to get offline documentation for the Apple SDK, as 
it is often quicker.

Here's a simple example, and an obligatory screenshot.

![Hello world](Swift.png?raw=true "Swift playground - Hello World")

If you are trying it out, the results are hidden under the 
**View > Assistant Editor > Show Assistant Editor**

```
// Requires XCode 7.3.1
import Cocoa
import XCPlayground

func makeButton() -> NSButton {
    let button = NSButton(frame: NSMakeRect(0,0,100,40))
    button.title = "Hello"
    button.bezelStyle = .RoundedBezelStyle
    return button
}

// define a class to hold event handlers
class ViewDelegate: NSObject
{
    
    @objc func onButtonClick(sender: NSButton) {
        sender.title = (sender.title == "Hello") ? "Clicked" : "Hello"
        print("Clicked")
    }
    
}

// wire up event handlers
let viewDelegate = ViewDelegate()
let button = makeButton()
button.target = viewDelegate
button.action = #selector(viewDelegate.onButtonClick)

let container = NSView(frame: NSMakeRect(0, 0, 400, 100))
container.addSubview(button)

XCPlaygroundPage.currentPage.liveView = container;
```


[1]:http://joearms.github.io/2016/01/04/fun-with-swift.html
[2]:https://kapeli.com/dash
