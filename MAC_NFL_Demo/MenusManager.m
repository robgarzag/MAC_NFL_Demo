//
//  MenusManager.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "MenusManager.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kNavBarHeight 64
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMenuWidth 250
#define kAnimationDuration 0.2

@interface MenusManager ()

@end

@implementation MenusManager

//ChildViewControllers https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/CreatingCustomContainerViewControllers/CreatingCustomContainerViewControllers.html

- (instancetype)initWithParentViewController:(UIViewController*)parent
{
    self = [super init];
    if (self)
    {
        self.parentViewController =parent;
    }
    return self;
}

-(void) addChildViewController:(UIViewController*) childController
{
    [self.parentViewController addChildViewController:childController];
    [self.parentViewController.view addSubview:childController.view];
    [childController didMoveToParentViewController:self.parentViewController];
}

-(void) removeChildViewController:(UIViewController*) childController
{
    [childController willMoveToParentViewController:nil];
    [childController.view removeFromSuperview];
    [childController removeFromParentViewController];
}

-(void) openLeftMenu
{
    if (self.rightViewController)
    {
        [self hideRightMenu];
        return;
    }
    if (self.leftViewController)
    {
        [self hideLeftMenu];
        return;
    }
    self.leftViewController =  [self.parentViewController.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    self.leftViewController.view.frame = CGRectMake(-kMenuWidth, kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
    [self addChildViewController:self.leftViewController];
    [UIView animateWithDuration:kAnimationDuration animations:^
    {
        self.leftViewController.view.frame =CGRectMake(0, kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
    }];
}

-(void) hideLeftMenu
{
    [UIView animateWithDuration:kAnimationDuration animations:^
    {
        self.leftViewController.view.frame =CGRectMake(-kMenuWidth, kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
    } completion:^(BOOL finished)
    {
           [self removeChildViewController:self.leftViewController];
    }];
}

-(void) openRightMenu
{
    if (self.leftViewController)
    {
        [self hideLeftMenu];
        return;
    }
    if (self.rightViewController)
    {
        [self hideRightMenu];
        return;
    }
    self.rightViewController =  [self.parentViewController.storyboard instantiateViewControllerWithIdentifier:@"RightMenuViewController"];
    self.rightViewController.view.frame = CGRectMake(kScreenWidth, kNavBarHeight, kMenuWidth, kScreenHeight);
    [self addChildViewController:self.rightViewController];
    [UIView animateWithDuration:kAnimationDuration animations:^
    {
        self.rightViewController.view.frame = CGRectMake(kScreenWidth -kMenuWidth,kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
    }];
    [self addChildViewController:self.rightViewController];
}

-(void) hideRightMenu
{
    [UIView animateWithDuration:kAnimationDuration animations:^
     {
        self.rightViewController.view.frame = CGRectMake(kScreenWidth, kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
     } completion:^(BOOL finished)
     {
         [self removeChildViewController:self.rightViewController];
     }];
}


@end
