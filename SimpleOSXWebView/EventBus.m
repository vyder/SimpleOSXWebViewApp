//
//  EventBus.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/4/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "EventBus.h"

@implementation EventBus

// Generic init will expect listeners to implement the EventListenerProtocol
- (instancetype)init {
    return [self initWithListenerProtocol:@protocol(EventListenerProtocol) andSelector:@selector(onEvent:)];
}

// Specify custom EventListenerProtocol for event listeners
- (instancetype)initWithListenerProtocol:(Protocol *)listenerProtocol andSelector:(SEL)protocolSelector {
    self = [super init];
    if( self ) {
        self.listeners = [[NSMutableArray alloc] init];
        self.listenerProtocol = listenerProtocol;
        self.protocolSelector = protocolSelector;
    }
    return self;
}

// sendEvent handles NSEvents sent to this InteractionBus
// by notifying listeners
- (void)sendEvent:(NSEvent *)theEvent {
    [self.listeners makeObjectsPerformSelector:self.protocolSelector withObject:theEvent];
}

- (void)registerListener:(id)newListener {
    if( [newListener conformsToProtocol:self.listenerProtocol] ) {
        [self.listeners addObject:newListener];
    } else {
        [NSException raise:@"newListener does not conform to listenerProtocol" format:@"expected object to conform to Protocol: %@", self.listenerProtocol];
    }
}

- (void)deregisterListener:(id)theListener {
    [self.listeners removeObject:theListener];
}

// Returns YES if theListener is one of InteractionBus' listeners
- (BOOL)isListener:(id)theListener {
    return [self.listeners containsObject:theListener];
}

@end
