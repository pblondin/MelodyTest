//
//  AppDelegate.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "AppDelegate.h"

// audio
#import <AVFoundation/AVFoundation.h>

// helpers
#import "UIApplication+AppVersion.h"

#if DEBUG_MODE
#import <PonyDebugger/PonyDebugger.h>
#import <BTFLeakDetect/BTFLeakDetect.h>
#endif

#define LOG_LEVEL_DEF ddLogLevel
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DDLogInfo(@"Running Application VersionBuild: %@", [UIApplication versionBuild]);

#if DISTRIBUTION_MODE
    DDLogInfo(@"Distribution mode enabled");

    // Initialize Crashlytics and TwitterKit
    [Fabric with:@[ CrashlyticsKit, TwitterKit ]];
#endif

#if DEBUG_MODE
    DDLogInfo(@"Debug mode enabled");

    // Setup PonyDebugger
    PDDebugger *debugger = [PDDebugger defaultInstance];
    [debugger connectToURL:[NSURL URLWithString:@"ws://10.0.2.6:9000/device"]];
    [debugger enableNetworkTrafficDebugging];
    [debugger forwardAllNetworkTraffic];
    [debugger enableCoreDataDebugging];
    [debugger enableViewHierarchyDebugging];
#endif

    // Finish bootstrap

    // Configure LumberJack
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    // Prevent other audio to be stopped by this application
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];

    // Main storyboard
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your
    // application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background,
    // optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
