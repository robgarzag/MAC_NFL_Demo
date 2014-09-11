//
//  NFLGameStatsTableViewCell.h
//  MAC_NFL_Demo
//
//  Created by MAC on 9/10/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NFLGameStatsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel * statName;
@property (nonatomic, weak) IBOutlet  UILabel * team1Stats;
@property (nonatomic, weak)  IBOutlet UILabel * team2Stats;

-(void) fillWithTeam1Stats:(NSString*) team1Stats andTeam2Stats:(NSString*) team2Stats;

@end
