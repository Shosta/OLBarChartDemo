//
//  ViewHelper.h
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 02/09/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h> 


@interface ViewHelper : NSObject {

}

+(UIView *)roundedView:(UIView *)view withCornerRadius:(float)cornerRadius andBorderWidth:(float)borderWidth;

@end
