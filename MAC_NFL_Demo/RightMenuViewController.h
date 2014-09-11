//
//  RightMenuViewController.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "StatsTableViewController.h"
#import "MyPlayerViewController.h"
#import "ViewController.h"
@class ViewController;

@interface RightMenuViewController : UIViewController

@property (nonatomic, weak) ViewController*  mainViewController;
@property (nonatomic,weak) StatsTableViewController* statsViewController;
@property (nonatomic,weak) MyPlayerViewController*  playersViewController;
@end