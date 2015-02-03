# SimpleOSXWebViewApp

A simple OSX App that creates a WebView inside a regular window.

Additionally, this project also includes a component to help you handle interaction events that occur on that window, e.g. keyboard input, mouse gestures.

For example:

    # ViewController.h
    
    @interface MainViewController : NSViewController <InteractionEventListenerProtocol>
    @end

and

    # ViewController.m
  
    @implementation MainViewController
    ...
    - (void)onInteractionEvent:(NSEvent *)theEvent {
      NSLog(@"Received an interaction event at MainViewController: %@", theEvent );
    }
    ...

Should get you started with interpreting events that occur in that NSWindow.

I've got reasonable amount of documentation in here...and I'm actively working on this repo. Feel free to shoot me an email if you stumble across this and have quesitons.

