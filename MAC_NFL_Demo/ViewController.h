//
//  ViewController.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouTubeWebView.h"
#import "MenuManagerViewController.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet YouTubeWebView* webview;
@property (nonatomic, strong) MenuManagerViewController* menuManager;
@property (nonatomic, weak) IBOutlet UINavigationBar* navBar;
@property (nonatomic, weak) IBOutlet UINavigationItem* navItem;
@end
