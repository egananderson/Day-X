//
//  Entry.m
//  DayX
//
//  Created by Peter Woodrow on 5/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//



#import "Entry.h"

static NSString const *titleKey = @"title";
static NSString const *bodyTextKey = @"bodyText";
static NSString const *timestampKey = @"timeStamp";

@implementation Entry

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        self.title = dictionary[titleKey];
        self.bodyText = dictionary[bodyTextKey];
        self.timestamp = dictionary[timestampKey];
    }
    
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    if (self.title){
        dictionary[titleKey] = self.title;
    }
    if (self.bodyText){
        dictionary[bodyTextKey] = self.bodyText;
    }
    if (self.timestamp){
       dictionary[timestampKey] = self.timestamp;
    }
    
    return dictionary;
}

@end
