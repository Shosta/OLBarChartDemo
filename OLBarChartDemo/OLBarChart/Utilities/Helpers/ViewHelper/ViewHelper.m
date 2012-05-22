//
//  ViewHelper.m
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 02/09/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "ViewHelper.h"


@implementation ViewHelper

#pragma mark -
#pragma mark UIView rounded management

+(UIView *)roundedView:(UIView *)view withCornerRadius:(float)cornerRadius andBorderWidth:(float)borderWidth{ 
	view.layer.masksToBounds = YES; 
	view.layer.cornerRadius = cornerRadius; 
	view.layer.borderWidth = borderWidth; 
	// view.layer.borderColor = [[UIColor grayColor] CGColor];
	
	return view;
}

@end
