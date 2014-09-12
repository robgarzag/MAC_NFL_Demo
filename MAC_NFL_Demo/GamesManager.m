//
//  GamesManager.m
//  MAC_NFL_Demo
//
//  Created by MAC on 9/8/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "GamesManager.h"

//GamesParser
@implementation GamesManager

+(NSMutableArray*) gamesWithDictionaryArray:(NSArray*) array
{
    NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
    Game* game = nil;
    for (NSDictionary* dict in array)
    {
        game = [[Game alloc] initWithDictionary:dict];
        [mutableArray addObject:game];
    }
    return mutableArray;
}

- (instancetype)initWithPlistUrl:(NSString*)plistURL
{
    self = [super init];
    if (self)
    {
        NSArray* array = [NSArray arrayWithContentsOfFile:plistURL];
        self.games = [GamesManager gamesWithDictionaryArray:array];
    }
    return self;
}

@end
