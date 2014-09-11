//
//  MenusManager.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "MenusManager.h"


#define kNavBarHeight 64
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

-(void)removeCloseButton
{
    UIButton* closeButton = (UIButton*) [self.parentViewController.view viewWithTag:333];
    [UIView animateWithDuration:0.2 animations:^
     {
         closeButton.alpha= 0;
     }completion:^(BOOL finished)
    {
         if (closeButton)
         {
             [closeButton removeFromSuperview];
         }
     }];

}

-(void)addCloseButton
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor blackColor]];
    button.alpha= 0;
    button.tag= 333;
    CGRect frame = self.parentViewController.view.frame;
    frame.origin.y = 64;
    button.frame = frame;
    [button addTarget:self action:@selector(openLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.parentViewController.view addSubview:button];
    [UIView animateWithDuration:0.2 animations:^
     {
         button.alpha= .7;
     }];
    
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
    [self addCloseButton];
    [self addChildViewController:self.leftViewController];
    self.leftViewController.delegate = self.parentViewController;
    [UIView animateWithDuration:kAnimationDuration animations:^
    {
        self.leftViewController.view.frame =CGRectMake(0, kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
    }];

}

-(void) hideLeftMenu
{
    [self removeCloseButton];
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
    self.rightViewController.mainViewController = (ViewController*)self.parentViewController;
    self.rightViewController.view.frame = CGRectMake(kScreenWidth, kNavBarHeight, kMenuWidth, kScreenHeight);
    [self addCloseButton];
    [self addChildViewController:self.rightViewController];
    [UIView animateWithDuration:kAnimationDuration animations:^
    {
        self.rightViewController.view.frame = CGRectMake(kScreenWidth -kMenuWidth,kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
    }];
    [self addChildViewController:self.rightViewController];
}

-(void) hideRightMenu
{
    [self removeCloseButton];
    [UIView animateWithDuration:kAnimationDuration animations:^
     {
        self.rightViewController.view.frame = CGRectMake(kScreenWidth, kNavBarHeight, kMenuWidth, kScreenHeight-kNavBarHeight);
     } completion:^(BOOL finished)
     {
         [self removeChildViewController:self.rightViewController];
     }];
}


@end
