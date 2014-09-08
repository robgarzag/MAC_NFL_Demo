//
//  Game.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/7/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "Game.h"

@implementation Game

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [[Game alloc] init];
    if (self)
    {
        self.statusTitle = [dictionary objectForKey:@"statusTitle"];
        self.localTeamImage = [dictionary objectForKey:@"localTeamImage"];
        self.localTeamScore = [dictionary objectForKey:@"localTeamScore"];
        self.visitorTeamImage =[dictionary objectForKey:@"visitorTeamImage"];
        self.visitorTeamScore =[dictionary objectForKey:@"visitorTeamScore"];
        self.youTubeLinkURL =[dictionary objectForKey:@"youTubeLinkURL"];
        self.stats = [[GameStats alloc] initWithDictionary:[dictionary objectForKey:@"stats"]];
    }
    return self;
}

@end
