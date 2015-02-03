//
//  InteractionsBus.m
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import "InteractionsBus.h"

@implementation InteractionsBus

- (instancetype)init {
    self = [super init];
    if( self ) {
        self.listeners = [[NSMutableArray alloc] init];
    }
    return self;
}

// sendEvent handles NSEvents sent to this InteractionBus
// by notifying listeners
- (void)sendEvent:(NSEvent *)theEvent {
    [self.listeners makeObjectsPerformSelector:@selector(onInteractionEvent:) withObject:theEvent];
}

- (void)registerListener:(id)newListener {
    if( [newListener conformsToProtocol:@protocol(InteractionEventListenerProtocol)] ) {
        [self.listeners addObject:newListener];
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
