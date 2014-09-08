//
//  GameStats.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/7/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameStats : NSObject
@property(nonatomic, strong) NSString* first;
@property(nonatomic, strong) NSString* third;
@property(nonatomic, strong) NSString* rushingYards;
@property(nonatomic, strong) NSString* pushingYards;
@property(nonatomic, strong) NSString* interceptionYards;



-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
