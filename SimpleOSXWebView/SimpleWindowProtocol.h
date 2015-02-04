//
//  SimpleWindowInterface.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/4/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#ifndef SimpleOSXWebView_SimpleWindowInterface_h
#define SimpleOSXWebView_SimpleWindowInterface_h

@protocol SimpleWindowProtocol

@property (strong, nonatomic) id eventDelegate;

- (instancetype)init;
- (instancetype)initWithContentRect:(NSRect)frame;

@end

#endif
