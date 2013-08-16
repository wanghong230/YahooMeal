//
//  MenuViewController.m
//  YahooMeal
//
//  Created by Hong  Wang on 8/15/13.
//  Copyright (c) 2013 Hong  Wang. All rights reserved.
//

#import "MenuViewController.h"
#import "CustomCell.h"
#import "DishViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Yahoo! Meal";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    if(cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:nil reuseIdentifier:@"CustomCell"];
    }
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 90;
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

@end
