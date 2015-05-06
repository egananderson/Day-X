//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Owner on 5/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "EntryController.h"

@implementation ListTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EntryController *newEntryController = [EntryController new];
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = newEntryController.entries[indexPath.row];
    
return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    EntryController *newEntryController = [EntryController new];
    return newEntryController.entries.count;
}
@end
