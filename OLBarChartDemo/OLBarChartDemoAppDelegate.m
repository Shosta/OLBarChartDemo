//
//  OLBarChartDemoAppDelegate.m
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 11/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "OLBarChartDemoAppDelegate.h"

#import "ColoredBarChartViewController.h"
#import "SectionnedBarChartViewController.h"
#import "NumerousBarChartViewController.h"
#import "SelectBarChartViewController.h"

@implementation OLBarChartDemoAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;


#pragma mark -
#pragma mark Object creation management

- (NSArray *)createViewControllers{
  // Override point for customization after application launch.
  ColoredBarChartViewController *coloredBarChartViewController = [[ColoredBarChartViewController alloc] initWithNibName:@"ColoredBarChartViewController" bundle:nil];
  SectionnedBarChartViewController *sectionedBarChartDemoViewController = [[SectionnedBarChartViewController alloc] initWithNibName:@"SectionnedBarChartViewController" bundle:nil];
  NumerousBarChartViewController *numerousBarChartViewController = [[NumerousBarChartViewController alloc] initWithNibName:@"NumerousBarChartViewController" bundle:nil];
  SelectBarChartViewController *selectBarChartViewController = [[SelectBarChartViewController alloc] initWithNibName:@"SelectBarChartViewController" bundle:nil];
 
  NSArray *views = [[NSArray alloc] initWithObjects:coloredBarChartViewController, sectionedBarChartDemoViewController, numerousBarChartViewController, selectBarChartViewController, nil];
  
  return [views autorelease];
}

- (UITabBarController *)createTabBarController{
  
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  [tabBarController setViewControllers:[self createViewControllers]];
  
  return [tabBarController autorelease];
}


#pragma mark -
#pragma mark Application action management

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // [tabBarController setToolbarItems:[NSArray arrayWithObjects:@"Up to Down", @"Down to Up", nil]];
  
  // self.window.rootViewController = self.viewController;
  self.window.rootViewController = [self createTabBarController];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

- (void)dealloc
{
  [_window release];
  [_viewController release];
    [super dealloc];
}

@end
