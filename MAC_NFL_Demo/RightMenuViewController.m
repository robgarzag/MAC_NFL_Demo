//
//  RightMenuViewController.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "RightMenuViewController.h"
#import "ViewController.h"

#define kIndexStats 0
#define kIndexMyPlayers 1

@interface RightMenuViewController ()

@end

@implementation RightMenuViewController


- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == kIndexMyPlayers)
    {
        [UIView animateWithDuration:0.2 animations:^
         {
             [self.statsViewController.view setAlpha:0];
             [self.playersViewController.view setAlpha:1];
         }];
    }
    else if (sender.selectedSegmentIndex == kIndexStats)
    {
        [UIView animateWithDuration:0.2 animations:^
        {
            [self.statsViewController.view setAlpha:1];
            [self.playersViewController.view setAlpha:0];
        }];
    }
}

-(void) addChildViewControllerFromSwitch:(UIViewController*) childController
{
    CGRect frame = childController.view.frame;
    frame.origin.y =50;
    frame.origin.x =5;
    frame.size.width =   240;
    frame.size.height =  450;
    childController.view.frame = frame;
    [self addChildViewController:childController];
    [self.view addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}

-(void) removeChildViewControllerFromSwitch:(UIViewController*) childController
{
    [childController willMoveToParentViewController:nil];
    [childController.view removeFromSuperview];
    [childController removeFromParentViewController];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.statsViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"StatsTableViewController"];
    ViewController* parentViewController= (ViewController*) self.mainViewController;
    self.statsViewController.selectedGame = [parentViewController selectedGame];
    [self addChildViewControllerFromSwitch:self.statsViewController];
    
    
    self.playersViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"MyPlayerTableViewController"];
    self.playersViewController.view.alpha =0;
    [self addChildViewControllerFromSwitch:self.playersViewController];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
