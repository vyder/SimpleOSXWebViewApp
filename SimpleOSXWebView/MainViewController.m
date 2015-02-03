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
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load site in the webview
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
    
    NSLog(@"Should be loading URL [%@] now...", url);
    
    // Respond to WebResourceLoadDelegate protocol
    [self.webView setResourceLoadDelegate:self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)webView:(WebView *)sender resource:(id)identifier didFinishLoadingFromDataSource:(WebDataSource *)dataSource {
    NSLog(@"Page resource should be done loading: %@", [[dataSource request] URL]);
}

// from InteractionEventListenerProtocol
- (void)onInteractionEvent:(NSEvent *)theEvent {
    NSLog(@"Received an interaction event at MainViewController: %@", theEvent );
}

@end
