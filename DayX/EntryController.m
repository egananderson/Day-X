//
//  EntryController.m
//  DayX
//
//  Created by Peter Woodrow on 5/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"
@import UIKit;

static NSString * const allEntriesKey = @"allEntries";

@interface EntryController ()

@property (strong, nonatomic) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *) sharedInstance
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        [sharedInstance loadFromPersistentStorage];
    });
    
    return sharedInstance;
}

- (void) addEntry:(Entry *)entry
{
    NSLog(@"%@", entry.title);
    //NSMutableArray *replacementArray = [(NSArray *)self.entries mutableCopy];
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:self.entries];
    [tempArray addObject:entry];
    //possibly passing objects to new NSArray
    self.entries = tempArray;
    //[self saveToPersistentStorage];
}

- (void) removeEntry:(Entry *)entry{
    NSMutableArray *replacementArray = [(NSArray *)self.entries mutableCopy];
    [replacementArray removeObject:entry];
    self.entries = replacementArray;
    [self saveToPersistentStorage];
}

- (Entry *)createEntryWithTitle:(NSString *)title withBodyText:(NSString *)bodyText
{
    Entry *entry = [Entry new];
    entry.title = title;
    entry.bodyText = bodyText;
    entry.timestamp = [NSDate date];

    [self addEntry:entry];
    
    return entry;

}

- (void)save
{
    [self saveToPersistentStorage];
    
}

- (void)saveToPersistentStorage
{
    
    NSMutableArray *tempArray = [NSMutableArray new];
    NSLog(@"%d", (int)self.entries.count);
    for (Entry *entry in self.entries) {
        [tempArray addObject:[entry dictionaryRepresentation]];
        NSLog(@"SAVE title:%@   bodyText:%@", entry.title, entry.bodyText);
    }
    NSLog(@"GOT HERE AGAIN");

    [[NSUserDefaults standardUserDefaults] setObject:tempArray forKey:allEntriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)loadFromPersistentStorage
{
    NSMutableArray *showingArray = [NSMutableArray new];
    NSArray *loadArray = [[NSUserDefaults standardUserDefaults] objectForKey:allEntriesKey];
    for (NSDictionary *dictionary in loadArray) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        NSLog(@"LOAD title:%@   bodyText:%@", entry.title, entry.bodyText);
        [showingArray addObject:entry];
    }
    
    self.entries = showingArray;
    
}

@end








