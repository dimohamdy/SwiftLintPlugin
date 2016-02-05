//
//  SimplePersistence.m
//  SwiftLintPlugin
//
//  Created by Mohamed Afifi on 2/5/16.
//  Copyright © 2016 mohamede1945. All rights reserved.
//

#import "SimplePersistence.h"

@interface SimplePersistence ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation SimplePersistence

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (BOOL)swiftLintEnabled
{
    NSNumber *object = [self.userDefaults objectForKey:NSStringFromSelector(@selector(swiftLintEnabled))];
    if (object == nil) {
        return YES;
    }
    return object.boolValue;
}

- (void)setSwiftLintEnabled:(BOOL)swiftLintEnabled
{
    [self.userDefaults setObject:@(swiftLintEnabled) forKey:NSStringFromSelector(@selector(swiftLintEnabled))];
    [self.userDefaults synchronize];
}

- (BOOL)useConfigurationFile
{
    return [self.userDefaults boolForKey:NSStringFromSelector(@selector(useConfigurationFile))];
}

- (void)setUseConfigurationFile:(BOOL)useConfigurationFile
{
    [self.userDefaults setObject:@(useConfigurationFile) forKey:NSStringFromSelector(@selector(useConfigurationFile))];
    [self.userDefaults synchronize];
}

@end
