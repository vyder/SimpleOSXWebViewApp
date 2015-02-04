//
//  BorderlessWindow.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/4/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "BorderlessWindow.h"

@implementation BorderlessWindow

@synthesize eventDelegate;

- (instancetype)init {
    NSRect defaultRect = NSMakeRect(0.0, 0.0, 760, 550);
    return [self initWithContentRect:defaultRect];
}

- (instancetype)initWithContentRect:(NSRect)frame {
    if (self = [super initWithContentRect:frame
                                styleMask:NSBorderlessWindowMask
                                  backing:NSBackingStoreBuffered
                                    defer:YES] ) {
        [self setHasShadow:YES];
        return self;
    }
    return nil;
}

// Dispatches mouse and keyboard events sent to the window by the NSApplication object
- (void)sendEvent:(NSEvent *)theEvent {
    if( self.eventDelegate != nil ) {
        [self.eventDelegate sendEvent:theEvent];
    }

    // snippet source: http://stackoverflow.com/q/7287696/834459
    if([theEvent type] == NSLeftMouseDown)
        [self mouseDown:theEvent];
    else if([theEvent type] == NSLeftMouseDragged)
        [self mouseDragged:theEvent];

    // Let the event bubble up
    [super sendEvent:theEvent];
}

- (void)mouseDown:(NSEvent *)theEvent {
    // Set the starting spot
    self.currentWindowPosition = [theEvent locationInWindow];
}

// Allow the window to be moved by grabbing the top 40px
- (void)mouseDragged:(NSEvent *)theEvent {
    NSRect screenVisibleFrame = [[NSScreen mainScreen] visibleFrame];
    NSRect windowFrame = [self frame];
    NSPoint newOrigin = windowFrame.origin;
    
    NSPoint currentMousePosition = [theEvent locationInWindow];
    if(currentMousePosition.y > windowFrame.size.height - 40)
    {
        newOrigin.x += (currentMousePosition.x - self.currentWindowPosition.x);
        newOrigin.y += (currentMousePosition.y - self.currentWindowPosition.y);
        
        if ((newOrigin.y + windowFrame.size.height) > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height))
        {
            newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height);
        }
        
        [self setFrameOrigin:newOrigin];
    }
}


- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

@end

