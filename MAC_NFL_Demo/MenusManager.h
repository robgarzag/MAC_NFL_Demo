//
//  MenusManager.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"

@interface MenusManager : NSObject

@property (nonatomic, weak) UIViewController*               parentViewController;
@property (nonatomic, weak) LeftMenuViewController  *       leftViewController;
@property (nonatomic, weak) RightMenuViewController *       rightViewController;

-(void) openLeftMenu;
-(void) hideLeftMenu;

-(void) openRightMenu;
-(void) hideRightMenu;

- (instancetype)initWithParentViewController:(UIViewController*)parent;

@end
