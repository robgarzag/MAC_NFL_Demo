//
//  LeftMenuViewController.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/8/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamesManager.h"
@interface LeftMenuViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray* games;
@property (nonatomic,strong) id delegate;

@end

@protocol LeftMenuDelegate <NSObject>
@required
- (void) selectedGame:(Game*)game;
@end
