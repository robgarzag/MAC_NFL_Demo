//
//  GameStats.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/7/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "GameStats.h"

@implementation GameStats

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self)
    {
        self.first = [dictionary objectForKey:@"first"];
        self.third = [dictionary objectForKey:@"third"];
        self.rushingYards = [dictionary objectForKey:@"rushingYards"];
        self.pushingYards =[dictionary objectForKey:@"pushingYards"];
        self.interceptionYards =[dictionary objectForKey:@"interceptionYards"];
    }
    return self;
}

@end
