//
//  MyPlayerTableViewController.m
//  MAC_NFL_Demo
//
//  Created by MAC on 9/11/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "MyPlayerTableViewController.h"
#import "NFLGameStatsTableViewCell.h"

@interface MyPlayerTableViewController ()

@end

@implementation MyPlayerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* array = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Players" withExtension:@".plist"]];
    self.players = [PlayersManager playersWithDictionaryArray:array];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [view setBackgroundColor:[UIColor lightGrayColor]];

    UILabel * team0Lbl =[[UILabel alloc] init];
    team0Lbl.frame = CGRectMake(10 ,0 , 100, 35);
    team0Lbl.font = [UIFont boldSystemFontOfSize:11];
    [view addSubview:team0Lbl];
    team0Lbl.text = @"PLAYER NAME";
    team0Lbl.contentScaleFactor = .5;
    team0Lbl.adjustsFontSizeToFitWidth =YES;
    
    UILabel * team1Lbl =[[UILabel alloc] init];
    team1Lbl.font = [UIFont boldSystemFontOfSize:11];
    team1Lbl.frame = CGRectMake(view.frame.size.width - 100,0 , 35, 35);
    [view addSubview:team1Lbl];
    team1Lbl.text = @"TEAM";
    team1Lbl.contentScaleFactor = .5;
    team1Lbl.adjustsFontSizeToFitWidth =YES;
    
    UILabel * team2Lbl =[[UILabel alloc] init];
    team2Lbl.font = [UIFont boldSystemFontOfSize:11];
    team2Lbl.frame = CGRectMake(view.frame.size.width - 50,0 , 35, 35);
    [view addSubview:team2Lbl];
    team2Lbl.text = @" POS";
    team2Lbl.contentScaleFactor = .5;
    team2Lbl.adjustsFontSizeToFitWidth =YES;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NFLGameStatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"statsCell" forIndexPath:indexPath];
    UIView* backgroundView = [[UIView alloc] initWithFrame:cell.frame];
    [backgroundView setBackgroundColor:[UIColor grayColor]];
    cell.selectedBackgroundView = backgroundView;
    
    Player* player= [self.players objectAtIndex:indexPath.row];
    cell.statName.text = player.name;
    [cell fillWithTeam1Stats:player.team andTeam2Stats:player.position];
    return cell;
}

@end
