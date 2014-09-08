//
//  MenuManagerViewController.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "MenuManagerViewController.h"

@interface MenuManagerViewController ()

@end

@implementation MenuManagerViewController

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
    self.leftViewController.view.frame = CGRectMake(-250, 64, 250, [UIScreen mainScreen].bounds.size.height);
    [self addChildViewController:self.leftViewController];
    [UIView animateWithDuration:0.4 animations:^{
        self.leftViewController.view.frame =CGRectMake(0, 64, 250, [UIScreen mainScreen].bounds.size.height);
    }];
}

-(void) hideLeftMenu
{
    [UIView animateWithDuration:0.4 animations:^
    {
        self.leftViewController.view.frame =CGRectMake(-250, 64, 250, [UIScreen mainScreen].bounds.size.height);
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
    self.rightViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 64, 250, [UIScreen mainScreen].bounds.size.height);
    [self addChildViewController:self.rightViewController];
    [UIView animateWithDuration:0.4 animations:^
    {
        self.rightViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -250, 64, 250, [UIScreen mainScreen].bounds.size.height);
    }];
    [self addChildViewController:self.rightViewController];
}

-(void) hideRightMenu
{
    [UIView animateWithDuration:0.4 animations:^
     {
        self.rightViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 64, 250, [UIScreen mainScreen].bounds.size.height);
     } completion:^(BOOL finished)
     {
         [self removeChildViewController:self.rightViewController];
     }];
}


@end
