//
//  NumerousBarChartViewController.m
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 01/09/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "NumerousBarChartViewController.h"


@implementation NumerousBarChartViewController

@synthesize barChartScrollView;

#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    UIImage* anImage = [UIImage imageNamed:@"barchart-blue.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Numerous" image:anImage tag:0];
    self.tabBarItem = theItem;
    [theItem release];
  }
  return self;
}


#pragma mark -
#pragma mark Barchart view datasource methods

- (NSInteger)numberOfSectionsInBarChart:(OLBarChartScrollView *)barChart{
  return 8;
}

- (NSInteger)barChart:(OLBarChartScrollView *)barChart numberOfBarInSection:(NSInteger)section{
  if ( section == 0 || section == 2 || section == 4 || section == 6 ) {
    return [secondPercentArray count];
  }
  if ( section == 1 || section == 3 || section == 5 || section == 7 ) {
    return [percentArray count];
  }
  
  return 0;
}

- (OLBar *)barChart:(OLBarChartScrollView *)barChart barForChartAtIndexPath:(NSIndexPath *)indexPath{
  
  OLBar *bar = [barChart dequeueReusableBar];
  if ( bar == nil ) {
    bar = [[[OLBar alloc] initWithFrame:self.barChartScrollView.frame] autorelease];
  }
  
  // Define the value for each bar for each section.
  if ( indexPath.section == 0 || indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6 ) {
    int r = [[secondPercentArray objectAtIndex:indexPath.row] intValue]; //rand() % 100;
    [bar setPercentValue:r];
    [bar setHorizontalLegendValue:[NSString stringWithFormat:@"%d/12", indexPath.row]];
    [bar setVerticalLegendValue:[NSString stringWithFormat:@"%d$", r]];
  }
  if ( indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5 || indexPath.section == 7 ) {
    int r = [[percentArray objectAtIndex:indexPath.row] intValue]; //rand() % 100;
    [bar setPercentValue:r];
    [bar setHorizontalLegendValue:[NSString stringWithFormat:@"%d/11", indexPath.row]];
    [bar setVerticalLegendValue:[NSString stringWithFormat:@"%d€", r]];
  }
  
	return bar;
}


#pragma mark -
#pragma mark Barchart view delegate methods

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
    return [UIColor redColor];
  }
  if ( indexPath.section == 1 ) {
    return [UIColor orangeColor];
  }
  if ( indexPath.section == 2 ) {
    return [UIColor yellowColor];
  }
  if ( indexPath.section == 3 ) {
    return [UIColor cyanColor];
  }
  if ( indexPath.section == 4 ) {
    return [UIColor greenColor];
  }
  if ( indexPath.section == 5 ) {
    return [UIColor brownColor];
  }
  if ( indexPath.section == 6 ) {
    return [UIColor blueColor];
  }
  if ( indexPath.section == 7 ) {
    return [UIColor magentaColor];
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
#pragma mark Memory management

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


#pragma mark - 
#pragma mark View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  percentArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:10], 
                  [NSNumber numberWithInt:20], 
                  [NSNumber numberWithInt:30], 
                  [NSNumber numberWithInt:40], 
                  [NSNumber numberWithInt:50], 
                  [NSNumber numberWithInt:60], 
                  [NSNumber numberWithInt:70], 
                  [NSNumber numberWithInt:80], 
                  [NSNumber numberWithInt:90], 
                  [NSNumber numberWithInt:100], nil];
  
  
  secondPercentArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:90], 
                        [NSNumber numberWithInt:80], 
                        [NSNumber numberWithInt:70], 
                        [NSNumber numberWithInt:60],
                        [NSNumber numberWithInt:50], 
                        [NSNumber numberWithInt:40], 
                        [NSNumber numberWithInt:30], 
                        [NSNumber numberWithInt:20],
                        [NSNumber numberWithInt:10], nil];
  
  barChartScrollView = [[OLBarChartScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 320)];
  barChartScrollView.barDataSource = self;
	barChartScrollView.barDelegate = self;
  barChartScrollView.backgroundColor = [UIColor clearColor];
  
	[self.view addSubview:barChartScrollView];
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
