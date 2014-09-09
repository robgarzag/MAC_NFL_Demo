//
//  GamesManager.h
//  MAC_NFL_Demo
//
//  Created by MAC on 9/8/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GamesManager : NSObject

@property(nonatomic, strong) NSMutableArray* games;

+(NSMutableArray*) gamesWithDictionaryArray:(NSArray*) array;
- (instancetype)initWithPlistUrl:(NSString*)plistURL;

@end
