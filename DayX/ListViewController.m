//
//  ViewController.m
//  DayX
//
//  Created by Caleb Hicks on 4/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "EntryController.h"


static NSString *viewEntry = @"viewEntry";
static NSString *addEntry = @"addEntry";

@interface ListViewController () <UITableViewDelegate>

@property (nonatomic) int entryIndex;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self viewWillAppear];
}

- (void)viewWillAppear:(BOOL)animated
{
    //reload tableview here:
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:addEntry])
    {
        //we will not pass an entry
        DetailViewController *detailView = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:viewEntry])
    {
        //pass the selected entry to the detailview
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        DetailViewController *detailView = segue.destinationViewController;
        
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        detailView.entry = entry;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
    
    self.entryIndex = (int)indexPath.row;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
