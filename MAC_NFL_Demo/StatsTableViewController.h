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

@property (nonatomic, weak) Game* selectedGame;
@property (nonatomic, weak) GameStats * visitorStats;
@property (nonatomic, weak) GameStats * localStats;
@end
