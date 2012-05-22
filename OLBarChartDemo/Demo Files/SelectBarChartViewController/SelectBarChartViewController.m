//
//  SelectBarChartViewController.m
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 01/09/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "SelectBarChartViewController.h"


@implementation SelectBarChartViewController

@synthesize barChartScrollView;


#pragma mark -
#pragma mark Barchart view datasource methods

- (NSInteger)numberOfSectionsInBarChart:(OLBarChartScrollView *)barChart{
  return 3;
}

- (NSInteger)barChart:(OLBarChartScrollView *)barChart numberOfBarInSection:(NSInteger)section{
  if ( section == 0 ) {
    return 2;
  }
  if ( section == 1 ) {
    return 1;
  }
  if ( section == 2 ) {
    return 1;
  }
  
  return 0;
}

- (OLBar *)barChart:(OLBarChartScrollView *)barChart barForChartAtIndexPath:(NSIndexPath *)indexPath{
  
  OLBar *bar = [barChart dequeueReusableBar];
  if ( bar == nil ) {
    bar = [[[OLBar alloc] initWithFrame:self.barChartScrollView.frame] autorelease];
  }
  
  // Define the value for each bar for each section.
  if ( indexPath.section == 0 ) {
    [bar setPercentValue:70];
  }
  if ( indexPath.section == 1 ) {
    [bar setPercentValue:30];
  }
  if ( indexPath.section == 2 ) {
    [bar setPercentValue:50];
  }
  [bar setHorizontalLegendValue:[NSString stringWithFormat:@"Section %d", indexPath.section]];
  [bar setVerticalLegendValue:[NSString stringWithFormat:@"Bar %d", indexPath.row]];
  
	return bar;
}


#pragma mark -
#pragma mark Barchart view design delegate methods

- (NSInteger)barChart:(OLBarChartScrollView *)barChart widthForBarAtIndexPath:(NSIndexPath *)indexPath{
  return 50;
}

/*
 - (UIColor *)barChart:(OLBarChartScrollView *)barChart backgroundColorForBarAtIndexPath:(NSIndexPath *)indexPath{
 return [UIColor blueColor];
 }
 */
- (UIColor *)barChart:(OLBarChartScrollView *)barChart colorForGaugeAtIndexPath:(NSIndexPath *)indexPath{
  if ( indexPath.section == 0 ) {
    return [UIColor blueColor];
  }
  if ( indexPath.section == 1 ) {
    return [UIColor greenColor];
  }
  if ( indexPath.section == 2 ) {
    return [UIColor redColor];
  }
  
  return [UIColor orangeColor];
}
/*
 - (UIColor *)barChart:(OLBarChartScrollView *)barChart backgroundColorForGaugeAtIndexPath:(NSIndexPath *)indexPath{
 return [UIColor brownColor];
 }
 
 - (UIColor *)barChart:(OLBarChartScrollView *)barChart backgroundColorForHorizontalLegendAtIndexPath:(NSIndexPath *)indexPath{
 return [UIColor greenColor];
 }
 
 - (UIColor *)barChart:(OLBarChartScrollView *)barChart backgroundColorForVerticalLegendAtIndexPath:(NSIndexPath *)indexPath{
 return [UIColor yellowColor];
 }
 */


- (BOOL)barChart:(OLBarChartScrollView *)barChart outerShadowForGaugeAtIndexPath:(NSIndexPath *)indexPath{
  
  return NO;
}


#pragma mark -
#pragma mark Barchart view design delegate methods

- (void)barChart:(OLBarChartScrollView *)tableView didSelectBarAtIndexPath:(NSIndexPath *)indexPath{
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Action" 
                                                      message:[NSString stringWithFormat:@"You can make any action you want for this specific bar (Bar on section:%d, bar:%d).", indexPath.section, indexPath.row]
                                                     delegate:self 
                                            cancelButtonTitle:@"Cancel" 
                                            otherButtonTitles:@"OK", nil]; 
  [alertView show];
}


#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    UIImage* anImage = [UIImage imageNamed:@"barchart-multicolor.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Selected" image:anImage tag:0];
    self.tabBarItem = theItem;
    [theItem release];
  }
  
  return self;
}

- (void)dealloc
{
  [barChartScrollView release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Do any additional setup after loading the view from its nib.
  barChartScrollView = [[OLBarChartScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 320)];
  barChartScrollView.barDataSource = self;
	barChartScrollView.barDelegate = self;
  barChartScrollView.backgroundColor = [UIColor clearColor];
  
	[self.view addSubview:barChartScrollView];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
