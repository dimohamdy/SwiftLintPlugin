//
//  SwiftLintPlugin.h
//  SwiftLintPlugin
//
//  Created by Mohamed Afifi on 2/5/16.
//  Copyright © 2016 mohamede1945. All rights reserved.
//

#import <AppKit/AppKit.h>

@class SwiftLintPlugin;

static SwiftLintPlugin *sharedPlugin;

@interface SwiftLintPlugin : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end