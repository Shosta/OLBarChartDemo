//
//  TestBarChartViewController.m
//  OLBarChartDemo
//
//  Created by Rémi LAVEDRINE on 02/09/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "TestBarChartViewController.h"


@implementation TestBarChartViewController

- (NSInteger)numberOfSectionsInBarChart:(OLBarChartScrollView *)barChart{
  return 6;
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
  if ( section == 3 ) {
    return 1;
  }
  if ( section == 4 ) {
    return 1;
  }
  if ( section == 5 ) {
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
  if ( indexPath.section == 3 ) {
    [bar setPercentValue:10];
  }
  if ( indexPath.section == 4 ) {
    [bar setPercentValue:60];
  }
  if ( indexPath.section == 5 ) {
    [bar setPercentValue:65];
  }
  [bar setHorizontalLegendValue:[NSString stringWithFormat:@"Section %d", indexPath.section]];
  [bar setVerticalLegendValue:[NSString stringWithFormat:@"Bar %d", indexPath.row]];
  
  
	return bar;
}

- (NSInteger)barChart:(OLBarChartScrollView *)barChart widthForBarAtIndexPath:(NSIndexPath *)indexPath{
  return 50;
}

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
  if ( indexPath.section == 3 ) {
    return [UIColor cyanColor];
  }
  if ( indexPath.section == 4 ) {
    return [UIColor magentaColor];
  }
  if ( indexPath.section == 5 ) {
    return [UIColor yellowColor];
  }
  
  return [UIColor orangeColor];
}


#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      UIImage* anImage = [UIImage imageNamed:@"barchart-multicolor.png"];
      UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Test" image:anImage tag:0];
      self.tabBarItem = theItem;
      [theItem release];
    }
    return self;
}

- (void)dealloc
{
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
