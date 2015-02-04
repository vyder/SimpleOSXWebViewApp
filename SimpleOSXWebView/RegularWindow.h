//
//  MainWindow.h
//  SimpleOSXWebView
//
//  Created by Vidur Murali on 2/3/15.
//  Copyright (c) 2015 Vidur Murali. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RegularWindow : NSWindow

@property (strong, nonatomic) id eventDelegate;

- (instancetype)init;
- (instancetype)initWithContentRect:(NSRect)frame;

@end
