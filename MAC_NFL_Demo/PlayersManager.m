//
//  PlayersManager.m
//  MAC_NFL_Demo
//
//  Created by MAC on 9/11/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "PlayersManager.h"

@implementation PlayersManager

+(NSMutableArray*) playersWithDictionaryArray:(NSArray*) array
{
    NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
    for (NSDictionary* dict in array)
    {
        Player * player = [[Player alloc] initWithDictionary:dict];
        [mutableArray addObject:player];
    }
    return mutableArray;
}

- (instancetype)initWithPlistUrl:(NSString*)plistURL;
{
    self = [super init];
    if (self)
    {
        NSArray* array = [NSArray arrayWithContentsOfFile:plistURL];
        self.players= [PlayersManager playersWithDictionaryArray:array];
    }
    return self;
}

@end
