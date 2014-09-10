//
//  ViewController.h
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouTubeWebView.h"
#import "MenusManager.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet YouTubeWebView* webview;
@property (nonatomic, strong) MenusManager* menuManager;
@property (nonatomic, weak) IBOutlet UINavigationBar* navBar;
@property (nonatomic, weak) IBOutlet UINavigationItem* navItem;

//NOW SELECTED
@property (nonatomic,weak) IBOutlet UILabel* localTeamScoreLbl;
@property (nonatomic,weak) IBOutlet UILabel* visitorTeamScoreLbl;
@property (nonatomic,weak) IBOutlet UIImageView* localTeamImg;
@property (nonatomic,weak) IBOutlet UIImageView* visitorTeamImg;

@end
