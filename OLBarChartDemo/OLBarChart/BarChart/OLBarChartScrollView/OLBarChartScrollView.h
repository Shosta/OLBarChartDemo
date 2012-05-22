//
//  OLBarChartScrollView.h
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 29/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
// The one

#import <UIKit/UIKit.h>
#import "OLBarChartDataSource.h"
#import "OLBarChartDelegate.h"
#import "NSMutableArray+QueueAdditions.h"
#import "OLBar.h"

@interface OLBarChartScrollView : UIScrollView <UIScrollViewDelegate> {
@private
  NSMutableArray *visibleOLBars_;
  NSMutableArray *allBars_;
	
	NSInteger numberOfSections;
  NSInteger numberOfBars;
  
  BOOL roundedCornerForBars;
  
	id barDataSource_;
	id barDelegate_;
  
  float previousOffsetX;
}

@property (assign) 	id barDataSource;
@property (assign) 	id barDelegate;

// public accessors, setter takes ownership
- (NSMutableArray *)visibleOLBars;
- (void)setRoundedCornerForBars:(BOOL)trueOrFalse;

// Bars creation
- (OLBar *)dequeueReusableBar;
- (OLBar *)createOLBarFromDataSourceAtIndexPath:(NSIndexPath *)indexPath;

@end
