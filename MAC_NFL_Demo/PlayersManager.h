//
//  PlayersManager.h
//  MAC_NFL_Demo
//
//  Created by MAC on 9/11/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayersManager : NSObject

@property(nonatomic, strong) NSMutableArray* players;

+(NSMutableArray*) playersWithDictionaryArray:(NSArray*) array;
- (instancetype)initWithPlistUrl:(NSString*)plistURL;


@end
