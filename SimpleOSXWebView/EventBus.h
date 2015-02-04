//
//  EventBus.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/4/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "Cocoa/Cocoa.h"
#import <Foundation/Foundation.h>

#import "EventListenerProtocol.h"

@interface EventBus : NSObject

@property (strong, nonatomic) NSMutableArray *listeners;
@property (strong, nonatomic) Protocol *listenerProtocol;
@property (nonatomic) SEL protocolSelector;

- (instancetype)init;
- (instancetype)initWithListenerProtocol:(Protocol *)listenerProtocol andSelector:(SEL)protocolSelector;

- (void)sendEvent:(NSEvent *)theEvent;

// Manager listeners
- (void)registerListener:(id)newListener;
- (void)deregisterListener:(id)theListener;
- (BOOL)isListener:(id)theListener;

@end