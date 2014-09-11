//
//  StatsTableViewController.m
//  MAC_NFL_Demo
//
//  Created by MAC on 9/10/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "StatsTableViewController.h"
#import "NFLGameStatsTableViewCell.h"

@interface StatsTableViewController ()

@end

@implementation StatsTableViewController

-(void)setSelectedGame:(Game *)selectedGame
{
    _selectedGame = selectedGame;
    self.visitorStats = [selectedGame visitorStats];
    self.localStats = [selectedGame localStats];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    

    UIImageView* team1ImageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.selectedGame.visitorTeamImage]];
    team1ImageView.contentMode = UIViewContentModeScaleAspectFit;
    team1ImageView.frame = CGRectMake(view.frame.size.width - 100,0 , 35, 35);
    [view addSubview:team1ImageView];
    
    UIImageView* team2ImageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.selectedGame.localTeamImage]];
    team2ImageView.contentMode = UIViewContentModeScaleAspectFit;
    team2ImageView.frame = CGRectMake(view.frame.size.width - 50,0 , 35, 35);
    [view addSubview:team2ImageView];
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
    switch (indexPath.row)
    {
        case 0:
             cell.statName.text = @"1st Downs";
            [cell fillWithTeam1Stats:self.selectedGame.localStats.first andTeam2Stats:self.selectedGame.visitorStats.first];
            break;
        case 1:
            cell.statName.text = @"3rd Down Efficency";
            [cell fillWithTeam1Stats:self.selectedGame.localStats.third andTeam2Stats:self.selectedGame.visitorStats.third];
            break;
        case 2:
            cell.statName.text = @"Rushing Yards";
            [cell fillWithTeam1Stats:self.selectedGame.localStats.rushingYards andTeam2Stats:self.selectedGame.visitorStats.rushingYards];
            break;
        case 3:
            cell.statName.text = @"Passing Yards";
            [cell fillWithTeam1Stats:self.selectedGame.localStats.pushingYards andTeam2Stats:self.selectedGame.visitorStats.pushingYards];
            break;
        case 4:
            cell.statName.text = @"Interception Yards";
            [cell fillWithTeam1Stats:self.selectedGame.localStats.interceptionYards andTeam2Stats:self.selectedGame.visitorStats.interceptionYards];
            break;
        default:
            break;
    }
    return cell;
}


@end
