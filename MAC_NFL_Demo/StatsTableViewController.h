//
//  StatsTableViewController.h
//  MAC_NFL_Demo
//
//  Created by MAC on 9/10/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface StatsTableViewController : UITableViewController

@property (nonatomic,assign) int selectedIndex;
@property (nonatomic,strong) NSMutableArray* games;;

@end
