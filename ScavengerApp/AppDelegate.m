//
//  AppDelegate.m
//  ScavengerApp
//
//  Created by Giovanni on 5/15/13.
//  Copyright (c) 2013 Code for Europe. All rights reserved.
//

#import "AppDelegate.h"

#import "SelectionViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"The app was started with the language: %@", language);
    
    
    [[AppState sharedInstance] restore];
    NSLog(@"I restored the active Profile: %f", [[[AppState sharedInstance] activeProfile] profileId]);
    if ([[AppState sharedInstance] playerIsInCompass]) {
        //TODO: load the compass view directly
    }
    
    
    
    BOOL needSetup = [[[NSUserDefaults standardUserDefaults] objectForKey:@"setupDone"] boolValue];
    if(needSetup)
    {
        //TODO: setup everything from the .json file included in the app. Unzip images, etc.
        //Then set "setupDone" as TRUE
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"setupDone"];
    }
    
    
    SelectionViewController *selectCharacterVC = [[SelectionViewController alloc] initWithNibName:@"SelectionViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:selectCharacterVC];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [[AppState sharedInstance] save];
}

@end
