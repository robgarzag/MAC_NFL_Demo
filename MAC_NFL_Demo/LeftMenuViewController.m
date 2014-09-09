//
//  LeftMenuViewController.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/8/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "NFLGameTableViewCell.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

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
    NSArray* gamesDictionaryArray = [NSArray arrayWithContentsOfURL :[[NSBundle mainBundle]URLForResource:@"Games" withExtension:@".plist" ]];
    self.games = [GamesManager gamesWithDictionaryArray:gamesDictionaryArray];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0) return 1;
    // Return the number of rows in the section.
    return self.games.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellSection0" forIndexPath:indexPath];
        return cell;
    }
    NFLGameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    [cell fillWithGame:[self.games objectAtIndex:indexPath.row]];
    // Configure the cell...
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate performSelector:@selector(selectedGame:) withObject:[self.games objectAtIndex:indexPath.row] afterDelay:0];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    if (indexPath.section ==0)
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellSection0"];
    else
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    return   cell.frame.size.height;
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


@end
