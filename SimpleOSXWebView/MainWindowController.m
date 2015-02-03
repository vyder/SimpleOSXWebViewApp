//
//  MainWindowController.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "MainWindowController.h"
#import "MainWindow.h"
#import "MainViewController.h"

// Common Library
#import "InteractionsBus.h"

@interface MainWindowController ()

@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) InteractionsBus *interactionsBus;

@end

@implementation MainWindowController

- (instancetype)initWithWindowNibName:(NSString *)windowNibName {
    self = [super initWithWindowNibName:windowNibName];
    if( self ) {
        self.interactionsBus = [[InteractionsBus alloc] init];
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Figure out the size of the content space in this window
    NSRect windowFrame = self.window.frame;
    NSRect contentViewFrame = ((NSView *)self.window.contentView).frame;
    
    CGFloat titleBarHeight = windowFrame.size.height - contentViewFrame.size.height;
    
    NSRect viewFrame = NSMakeRect(contentViewFrame.origin.x,
                                 (contentViewFrame.origin.y - titleBarHeight),
                                  contentViewFrame.size.width,
                                 (contentViewFrame.size.height - titleBarHeight));
    
    // Create a MainViewController and add it to the MainWindow
    self.mainViewController = [[MainViewController alloc] initWithFrame:viewFrame];
    [self.window.contentView addSubview:self.mainViewController.view];
    
    // Hook up the InteractionsBus to this controller's MainWindow
    [((MainWindow *)self.window) setEventDelegate:self.interactionsBus];
    
    // Add the MainViewController as a listener
    [self.interactionsBus registerListener:self.mainViewController];
}

@end