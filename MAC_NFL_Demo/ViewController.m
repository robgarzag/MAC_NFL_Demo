//
//  ViewController.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "ViewController.h"
#import "GamesManager.h"
@interface ViewController ()

@end

@implementation ViewController
//Now Selected

-(void) cleanUI
{
    self.localTeamScoreLbl.text = @"";
    self.visitorTeamScoreLbl.text = @"";
    self.visitorTeamImg.image = nil;
    self.localTeamImg.image = nil;
}
-(void) fillWithGame:(Game*)game
{
    [self cleanUI];
    if (game.localTeamScore)
        self.localTeamScoreLbl.text = game.localTeamScore;
    
    if (game.visitorTeamScore)
        self.visitorTeamScoreLbl.text = game.visitorTeamScore;
    
    if (game.visitorTeamImage)
        self.visitorTeamImg.image = [UIImage imageNamed:game.visitorTeamImage];
    
    if (game.localTeamImage)
        self.localTeamImg.image = [UIImage imageNamed:game.localTeamImage];
}

//@protocol LeftMenuDelegate <NSObject>
- (void) selectedGame:(Game*)game
{
    [self.webview setupWithYouTubeURL:game.youTubeLinkURL];
    [self fillWithGame:game];
    [self.menuManager hideLeftMenu];
    self.selectedGame = game;
}

// Do any additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* gamesDictionaryArray = [NSArray arrayWithContentsOfURL :[[NSBundle mainBundle]URLForResource:@"Games" withExtension:@".plist" ]];

    self.selectedGame =    [[GamesManager gamesWithDictionaryArray:gamesDictionaryArray] objectAtIndex:0];
    
    [self.webview setupWithYouTubeURL:self.selectedGame.youTubeLinkURL];
    
    self.menuManager = [[MenusManager alloc] initWithParentViewController:self];
    
    [self.navItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self.menuManager action:@selector(openLeftMenu)]];
    
    [self.navItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self.menuManager action:@selector(openRightMenu)]];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
