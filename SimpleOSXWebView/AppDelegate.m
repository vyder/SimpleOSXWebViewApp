//
//  AppDelegate.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "AppDelegate.h"

// Common
//#import "InteractionsBus.h"

// Main Window
#import "RegularWindow.h"
#import "PrimaryWindowController.h"
#import "PrimaryViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) PrimaryWindowController *primaryWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // Note: NSWindow creation process can (should?) be owned by the NSWindowController,
    //       but I've put it here so it's easy to swap out the various Window types to
    //       play around with the code
    
    // Create a RegularWindow
    RegularWindow *primaryWindow = [[RegularWindow alloc] init];

    // Create the MainWindow and MainViewController, and hook them up
    self.primaryWindowController = [[PrimaryWindowController alloc] initWithWindow:primaryWindow];
    [self.primaryWindowController.window setTitle:@"SimpleOSXWebViewApp"];
    [self.primaryWindowController.window center];
    
    // Make the primary window visible
    [self.primaryWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

// Quit the app if the priamry window is closed
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)app {
    return YES;
}

@end
