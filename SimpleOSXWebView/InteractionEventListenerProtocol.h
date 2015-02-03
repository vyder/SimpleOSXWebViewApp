//
//  InteractionEventListener.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#ifndef SimpleOSXWebView_InteractionEventListener_h
#define SimpleOSXWebView_InteractionEventListener_h
@protocol InteractionEventListenerProtocol

- (void)onInteractionEvent:(NSEvent *)theEvent;

@end

#endif
