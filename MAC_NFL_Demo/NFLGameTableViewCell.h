//
//  NFLGameTableViewCell.h
//  MAC_NFL_Demo
//
//  Created by MAC on 9/8/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
@interface NFLGameTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel* localTeamScoreLbl;
@property (nonatomic,weak) IBOutlet UILabel* visitorTeamScoreLbl;
@property (nonatomic,weak) IBOutlet UIImageView* localTeamImg;
@property (nonatomic,weak) IBOutlet UIImageView* visitorTeamImg;
@property (nonatomic,weak) IBOutlet UILabel* statusTitle;

-(void) fillWithGame:(Game*)game;
@end
