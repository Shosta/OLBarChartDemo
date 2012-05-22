//
//  ColoredBarChartViewController.h
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 11/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OLBarChartScrollView.h"

@interface ColoredBarChartViewController : UIViewController <OLBarChartDelegate, OLBarChartDataSource> {
    
	OLBarChartScrollView *barChartScrollView;
  
  NSArray *percentArray;
  NSArray *secondPercentArray;
  
}

@property (nonatomic, retain) OLBarChartScrollView *barChartScrollView;

@end
