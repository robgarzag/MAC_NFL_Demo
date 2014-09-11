//
//  NFLGameStatsTableViewCell.m
//  MAC_NFL_Demo
//
//  Created by David Garcia Chavez on 9/10/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "NFLGameStatsTableViewCell.h"

@implementation NFLGameStatsTableViewCell

-(void) cleanUI
{
    self.team1Stats.text =@"";
    self.team2Stats.text =@"";
}

-(void) fillWithTeam1Stats:(NSString*) team1Stats andTeam2Stats:(NSString*) team2Stats
{
    [self cleanUI];
    self.team1Stats.text = team1Stats;
    self.team2Stats.text = team2Stats;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
