//
//  ViewController.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "InteractionEventListenerProtocol.h"

@interface PrimaryViewController : NSViewController <InteractionEventListenerProtocol>

- (instancetype)initWithContentFrame:(NSRect)frame;

@end

