//
//  NumerousBarChartViewController.h
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 01/09/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OLBarChartScrollView.h"

@interface NumerousBarChartViewController : UIViewController <OLBarChartDelegate, OLBarChartDataSource> {
  
	OLBarChartScrollView *barChartScrollView;
  
  NSArray *percentArray;
  NSArray *secondPercentArray;
  
}

@property (nonatomic, retain) OLBarChartScrollView *barChartScrollView;

@end
