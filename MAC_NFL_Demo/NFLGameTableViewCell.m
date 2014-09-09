//
//  NFLGameTableViewCell.m
//  MAC_NFL_Demo
//
//  Created by MAC on 9/8/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "NFLGameTableViewCell.h"
#import "Game.h"
@implementation NFLGameTableViewCell

-(void) cleanUI
{
    self.localTeamScoreLbl.text = @"";
    self.visitorTeamScoreLbl.text = @"";
    self.visitorTeamImg.image = nil;
    self.localTeamImg.image = nil;
    self.statusTitle.text = @"";
}
-(void) fillWithGame:(Game*)game
{
    [self cleanUI];
    if (game.localTeamScore)
    self.localTeamScoreLbl.text = game.localTeamScore;
   
    if (game.visitorTeamScore)
        self.visitorTeamScoreLbl.text = game.visitorTeamScore;
    
    if (game.visitorTeamImage)
        self.visitorTeamImg.image = [UIImage imageNamed:game.visitorTeamImage];
    
    if (game.localTeamImage)
        self.localTeamImg.image = [UIImage imageNamed:game.localTeamImage];
    
    if (game.statusTitle)
        self.statusTitle.text = game.statusTitle;
    
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
