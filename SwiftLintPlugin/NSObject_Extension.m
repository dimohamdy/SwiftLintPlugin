//
//  NSObject_Extension.m
//  SwiftLintPlugin
//
//  Created by Mohamed Afifi on 2/5/16.
//  Copyright © 2016 mohamede1945. All rights reserved.
//


#import "NSObject_Extension.h"
#import "SwiftLintPlugin.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[SwiftLintPlugin alloc] initWithBundle:plugin];
        });
    }
}

@end
