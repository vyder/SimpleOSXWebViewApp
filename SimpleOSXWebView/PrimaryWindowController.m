//
//  MainWindowController.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "PrimaryWindowController.h"
#import "RegularWindow.h"
#import "PrimaryViewController.h"

// Common Library
#import "EventBus.h"
#import "InteractionEventListenerProtocol.h"

@interface PrimaryWindowController ()

@property (strong, nonatomic) PrimaryViewController *primaryViewController;
@property (strong, nonatomic) EventBus *interactionsEventBus;

@end

@implementation PrimaryWindowController

- (instancetype)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if( self ) {
        // Create a new EventBus to track interaction events for this NSWindow
        self.interactionsEventBus = [[EventBus alloc] initWithListenerProtocol:@protocol(InteractionEventListenerProtocol) andSelector:@selector(onInteractionEvent:)];
        
        // Figure out the size of the content space in this window
        NSRect contentViewFrame = ((NSView *)self.window.contentView).frame;
        NSRect viewFrame = NSMakeRect(contentViewFrame.origin.x,
                                      contentViewFrame.origin.y,
                                      contentViewFrame.size.width,
                                      contentViewFrame.size.height);
        
        // Create a PrimaryViewController and hook it up to the primary window
        self.primaryViewController = [[PrimaryViewController alloc] initWithContentFrame:viewFrame];
        [self.window.contentView addSubview:self.primaryViewController.view];
        
        // Hook up the interactions EventBus to listen to this controller's NSWindow events
        [((RegularWindow *)self.window) setEventDelegate:self.interactionsEventBus];
        
        // Add the PrimaryViewController as a listener
        [self.interactionsEventBus registerListener:self.primaryViewController];

    }
    return self;
}

@end