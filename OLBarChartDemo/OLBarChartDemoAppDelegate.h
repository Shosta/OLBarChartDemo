//
//  OLBarChartDemoAppDelegate.h
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 11/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColoredBarChartViewController;

@interface OLBarChartDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ColoredBarChartViewController *viewController;

@end
