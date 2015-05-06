//
//  EntryController.m
//  DayX
//
//  Created by Peter Woodrow on 5/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

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
        sharedInstance.entries = [NSArray new];
    });
    
    return sharedInstance;
}

- (void) addEntry:(Entry *)entry
{
    NSMutableArray *replacementArray = [(NSArray *)self.entries mutableCopy];
    [replacementArray addObject:entry];
    //possibly passing objects to new NSArray
    self.entries = replacementArray;
}

- (void) removeEntry:(Entry *)entry{
    NSMutableArray *replacementArray = [(NSArray *)self.entries mutableCopy];
    [replacementArray removeObject:entry];
    self.entries = replacementArray;
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

@end

