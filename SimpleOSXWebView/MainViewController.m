//
//  ViewController.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

@import WebKit;
#import "MainViewController.h"

@interface MainViewController ()

@property NSRect frame;
@property (strong, nonatomic) WebView *webView;
@property (strong, nonatomic) NSProgressIndicator *progressSpinner;

@end

@implementation MainViewController

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super init];
    if( self ) {
        self.frame = frame;
    }
    return self;
}

- (void)loadView {
    // Create parent view
    self.view = [[NSView alloc] initWithFrame:self.frame];
    
    // Create WebView and add it to the parent view
    self.webView = [[WebView alloc] initWithFrame:self.frame];
    [self.view addSubview:self.webView];
    
    // Respond to WebFrameLoadDelegate and WebResourceLoadDelegate protocols
    [self.webView setFrameLoadDelegate:self];
    [self.webView setResourceLoadDelegate:self];
    
    // Create the progress spinner and add it to the parent
    NSRect spinnerFrame = NSMakeRect(364.0, 270.0, 32.0, 32.0); // TODO: Remove this janky hardcoded positioning
    self.progressSpinner = [[NSProgressIndicator alloc] initWithFrame:spinnerFrame];
    [self.progressSpinner setStyle:NSProgressIndicatorSpinningStyle];
    
    // NO indicates that the spinner will be hidden when not animating
    [self.progressSpinner setDisplayedWhenStopped:NO];
    
    // Add spinner above webView so it's visible
    [self.view addSubview:self.progressSpinner positioned:NSWindowAbove relativeTo:self.webView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load site in the webview
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
    
    NSLog(@"Should be loading URL [%@] now...", url);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)webView:(WebView *)sender didStartProvisionalLoadForFrame:(WebFrame *)frame {
    // Start the spinner when the webView frame starts loading a new page
    [self.progressSpinner startAnimation:self];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    // Stop the spinner when the webView frame is done loading.
    [self.progressSpinner stopAnimation:self];
}

- (void)webView:(WebView *)sender resource:(id)identifier didFinishLoadingFromDataSource:(WebDataSource *)dataSource {
//    NSLog(@"Page resource should be done loading: %@", [[dataSource request] URL]);
}

// from InteractionEventListenerProtocol
- (void)onInteractionEvent:(NSEvent *)theEvent {
//    NSLog(@"Received an interaction event at MainViewController: %@", theEvent );
}

@end
