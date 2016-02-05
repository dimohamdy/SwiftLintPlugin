//
//  SwiftLintPlugin.m
//  SwiftLintPlugin
//
//  Created by Mohamed Afifi on 2/5/16.
//  Copyright © 2016 mohamede1945. All rights reserved.
//

#import "SwiftLintPlugin.h"
#import "SimplePersistence.h"
#import "ExtraBuildPhase.h"

@interface SwiftLintPlugin()

@property (nonatomic, strong, readwrite) NSBundle *bundle;

@property (nonatomic, strong, readwrite) SimplePersistence *persistence;
@end

@implementation SwiftLintPlugin

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        self.persistence = [[SimplePersistence alloc] init];

        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];

    // swizzl selectors
    [ExtraBuildPhase swizzleBuildPhasesSelectors];

    // Set up menu items
    NSMenuItem *productMenuItem = [[NSApp mainMenu] itemWithTitle:@"Product"];
    if (productMenuItem) {
        // Run swift lint item
        NSMenuItem *swiftLintEnabled = [[NSMenuItem alloc] initWithTitle:@"SwiftLint" action:@selector(toggleSwiftLint:) keyEquivalent:@""];
        [swiftLintEnabled setAlternate:NO];
        [swiftLintEnabled setTarget:self];
        [swiftLintEnabled setState:self.persistence.swiftLintEnabled ? NSOnState : NSOffState];

        // Add it to the product menu
        NSInteger runMenuItemIndex = [[productMenuItem submenu] indexOfItemWithTitle:@"Run"];
        [[productMenuItem submenu] insertItem:swiftLintEnabled atIndex:runMenuItemIndex + 2]; // Deal with hidden alternate "Run..." menu item.
    }
}

- (void)toggleSwiftLint:(NSMenuItem *)item
{
    self.persistence.swiftLintEnabled = !self.persistence.swiftLintEnabled;
    [item setState:self.persistence.swiftLintEnabled ? NSOnState : NSOffState];
}



@end
