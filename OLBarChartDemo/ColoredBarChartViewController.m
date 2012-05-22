 //
//  ColoredBarChartViewController.m
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 11/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "ColoredBarChartViewController.h"

@implementation ColoredBarChartViewController

@synthesize barChartScrollView;

#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    UIImage* anImage = [UIImage imageNamed:@"barchart-multicolor.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Colored" image:anImage tag:0];
    self.tabBarItem = theItem;
    [theItem release];
  }
  return self;
}


#pragma mark -
#pragma mark Barchart view datasource methods

- (NSInteger)numberOfSectionsInBarChart:(OLBarChartScrollView *)barChart{
  return 3;
}

- (NSInteger)barChart:(OLBarChartScrollView *)barChart numberOfBarInSection:(NSInteger)section{
  if ( section == 0 ) {
    return 1;
  }
  if ( section == 1 ) {
    return [percentArray count];
  }
  if ( section == 2 ) {
    return [secondPercentArray count];
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
    [bar setPercentValue:50];
    [bar setHorizontalLegendValue:[NSString stringWithFormat:@"Rems"]];
    [bar setVerticalLegendValue:[NSString stringWithFormat:@"Test"]];
  }
  
  if ( indexPath.section == 1 ) {
    int r = [[percentArray objectAtIndex:indexPath.row] intValue]; //rand() % 100;
    [bar setPercentValue:r];
    [bar setHorizontalLegendValue:[NSString stringWithFormat:@"%d/11", indexPath.row]];
    [bar setVerticalLegendValue:[NSString stringWithFormat:@"%d€", r]];
  }
  if ( indexPath.section == 2 ) {
    int r = [[secondPercentArray objectAtIndex:indexPath.row] intValue]; //rand() % 100;
    [bar setPercentValue:r];
    [bar setHorizontalLegendValue:[NSString stringWithFormat:@"%d/12", indexPath.row]];
    [bar setVerticalLegendValue:[NSString stringWithFormat:@"%d$", r]];
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
  if ( indexPath.section == 0 ) {
    return YES;
  }
  
  if ( indexPath.section == 1 ){
    if(indexPath.row == 1 || indexPath.row == 3 ) {
      return YES; 
    }  
  }
  
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
