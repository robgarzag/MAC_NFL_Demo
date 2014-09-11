//
//  Player.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/7/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "Player.h"

@implementation Player

/*
 @property(nonatomic, strong) NSString* name;
 @property(nonatomic, strong) NSString* team;
 @property(nonatomic, strong) NSString* position;
 */
-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self)
    {
        self.name = [dictionary objectForKey:@"name"];
        self.team = [dictionary objectForKey:@"team"];
        self.position = [dictionary objectForKey:@"position"];
    }
    return self;
}

@end
