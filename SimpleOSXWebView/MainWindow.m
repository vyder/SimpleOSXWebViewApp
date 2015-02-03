//
//  MainWindow.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "MainWindow.h"

@implementation MainWindow

// Dispatches mouse and keyboard events sent to the window by the NSApplication object
- (void)sendEvent:(NSEvent *)theEvent {
    if( self.eventDelegate != nil ) {
        [self.eventDelegate sendEvent:theEvent];
    }
    
    // Let the event bubble up
    [super sendEvent:theEvent];
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

@end
