//
//  Game.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/7/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameStats.h"

@interface Game : NSObject

@property(nonatomic, strong) NSString* statusTitle;
@property(nonatomic, strong) NSString* localTeamImage;
@property(nonatomic, strong) NSString* localTeamScore;
@property(nonatomic, strong) NSString* visitorTeamImage;
@property(nonatomic, strong) NSString* visitorTeamScore;
@property(nonatomic, strong) NSString* youTubeLinkURL;
@property(nonatomic,strong) GameStats* stats;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
