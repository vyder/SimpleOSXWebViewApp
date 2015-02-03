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
#import "MainWindow.h"
#import "MainWindowController.h"
#import "MainViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) MainWindowController *mainWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Create the MainWindow and MainViewController, and hook them up
    self.mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
    
    // Make the MainWindow visible
    [self.mainWindowController showWindow:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
