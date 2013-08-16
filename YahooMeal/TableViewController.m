//
//  TableViewController.m
//  YahooMeal
//
//  Created by Hong  Wang on 8/16/13.
//  Copyright (c) 2013 Hong  Wang. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"
#import "DishViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
     self.title = @"Yahoo! Meal";
    UINib *customNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"CustomCell"];

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIndetifier = @"CustomCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier];
    if(cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndetifier];
    }
    
    
    [cell.like addTarget:self action:@selector(onTouchup:) forControlEvents:UIControlEventTouchDown];
    [cell.dislike addTarget:self action:@selector(onTouchup:) forControlEvents:UIControlEventTouchDown];
    
//    CustomCell *cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndetifier];
    
    // Configure the cell...
    if(indexPath.row == 0) {
        cell.category.text = @"Pizza Special";
        cell.menuname.text = @"Roasted fig and prosciutto";
    } else if (indexPath.row == 1) {
        cell.category.text = @"market grill";
        cell.menuname.text = @"Diestel Ranch turkey burger";
    } else if (indexPath.row == 2) {
        cell.category.text = @"classics";
        cell.menuname.text = @"roasted Cajun spice chicken";
    } else {
        cell.category.text = @"stir-fry";
        cell.menuname.text = @"lemon chicken ";
    }
    
    return cell;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    DishViewController *dish = [[DishViewController alloc] init];
    dish.rowSelectedPreviously = indexPath.row;
    dish.sectionSelectedPreviously = indexPath.section;
    [self.navigationController pushViewController:dish animated:TRUE];
    NSLog(@"The section:%d The row:%d", indexPath.section, indexPath.row);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"URL's Café";
    else if(section == 1)
        return @"BUILDING G";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section == 0)
        return @"BUILDING G";
    else if(section == 1)
        return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 100;
}

//- (void) onLikeButton:(UIButton *)likeButton {
//    NSLog(@"Like Pushed");
//    likeButton.
//
//    [likeButton setHighlighted:YES];
////    [likeButton setSelected:TRUE];
//}
//
//- (void) onDislikeButton:(UIButton *)dislikeButton {
//    NSLog(@"Dislike Pushed");
//    [dislikeButton setHighlighted:TRUE];
//}

- (void)highlightButton:(UIButton *)b {
    [b setHighlighted:YES];
}

- (IBAction)onTouchup:(UIButton *)sender {
    [self performSelector:@selector(highlightButton:) withObject:sender afterDelay:0.0];
}
@end
