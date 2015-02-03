//
//  InteractionsBus.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "Cocoa/Cocoa.h"
#import <Foundation/Foundation.h>

#import "InteractionEventListenerProtocol.h"

@interface InteractionsBus : NSObject

@property (strong, nonatomic) NSMutableArray *listeners;

- (void)sendEvent:(NSEvent *)theEvent;

// Manager listeners
- (void)registerListener:(id)newListener;
- (void)deregisterListener:(id)theListener;
- (BOOL)isListener:(id)theListener;

@end
