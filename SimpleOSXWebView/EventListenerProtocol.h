//
//  EventListenerProtocol.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/4/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#ifndef SimpleOSXWebView_EventListenerProtocol_h
#define SimpleOSXWebView_EventListenerProtocol_h
@protocol EventListenerProtocol

- (void)onEvent:(NSEvent *)theEvent;

@end

#endif
