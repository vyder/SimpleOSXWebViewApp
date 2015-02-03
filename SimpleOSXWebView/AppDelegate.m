//
//  AppDelegate.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) IBOutlet NSWindowController *mainWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.mainWindowController = [[NSWindowController alloc] initWithWindowNibName:@"MainWindow"];
    [self.mainWindowController showWindow:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
